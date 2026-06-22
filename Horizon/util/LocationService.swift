//
//  LocationService.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import CoreLocation
import Foundation

enum LocationServiceError: LocalizedError {
    case permissionDenied
    case timedOut

    var errorDescription: String? {
        switch self {
        case .permissionDenied:
            return "Location access is turned off for Horizon. Enable it in Settings to see local weather."
        case .timedOut:
            return "Couldn't find your location in time. Check your connection and try again."
        }
    }
}


@MainActor
final class LocationService: NSObject, ObservableObject {

    @Published var authorizationStatus: CLAuthorizationStatus

    private let manager = CLLocationManager()
    private var continuation: CheckedContinuation<CLLocationCoordinate2D, Error>?
    private var authorizationContinuation: CheckedContinuation<Void, Never>?

    override init() {
        authorizationStatus = manager.authorizationStatus
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func requestCurrentLocation() async throws -> CLLocationCoordinate2D {
       

        if authorizationStatus == .notDetermined {
      
            await withCheckedContinuation { continuation in
                guard authorizationStatus == .notDetermined else {
               
                    continuation.resume()
                    return
                }
                authorizationContinuation = continuation
                manager.requestWhenInUseAuthorization()
               
            }
           
        }

        switch authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            break
        case .denied, .restricted, .notDetermined:
           
            throw LocationServiceError.permissionDenied
        @unknown default:
            throw LocationServiceError.permissionDenied
        }

        return try await withCheckedThrowingContinuation { continuation in
            self.continuation = continuation
            manager.requestLocation()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {

    nonisolated func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            let status = manager.authorizationStatus
          
            
            Task { @MainActor in
                self.authorizationStatus = status
                
               
                if status != .notDetermined {
                    self.authorizationContinuation?.resume()
                    self.authorizationContinuation = nil
                }
            }
        }

    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }
        Task { @MainActor in
            self.continuation?.resume(returning: coordinate)
            self.continuation = nil
        }
    }

    nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Task { @MainActor in
            if let clError = error as? CLError, clError.code == .denied {
                self.continuation?.resume(throwing: LocationServiceError.permissionDenied)
            } else {
                self.continuation?.resume(throwing: error)
            }
            self.continuation = nil
        }
    }
}
