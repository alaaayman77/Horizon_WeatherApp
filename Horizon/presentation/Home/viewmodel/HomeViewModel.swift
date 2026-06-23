//
//  HomeViewModel.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//


import CoreLocation
import Foundation
import SwiftData

@MainActor
final class HomeViewModel: ObservableObject {

    @Published private(set) var currentWeather: CurrentWeather?
    @Published private(set) var location: Location?
    @Published private(set) var dailyForecastItems: [DailyForecastItem] = []
    @Published private(set) var sunTimes: (sunrise: String, sunset: String)?
    @Published private(set) var isLoading = false
    @Published private(set) var greeting: String = ""
    @Published private(set) var currentDateTimeString: String = ""
    @Published private(set) var conditionIcon: String = "cloud.fill"
    @Published private(set) var sunProgress: Double = 0.5
    @Published private(set) var uvRoundedValue: Int = 0
    @Published private(set) var uvLabel: String = ""
    @Published private(set) var uvPercent: Double = 0
    @Published var errorMessage: String?
    @Published private(set) var isShowingCachedData: Bool = false

   
    private let getCurrentWeather: GetCurrentWeatherUsecase
    private let getDailyForecast: GetDailyForecastUsecase
    private let getLocation: GetLocationUsecase
    private let locationService: LocationService
    private let networkMonitor: NetworkMonitor
    private let saveCache: SaveWeatherCacheUsecase
    private let loadCache: LoadWeatherCacheUsecase
    private let query: String?

 
    init(
        query: String? = nil,
        context: ModelContext,
        getCurrentWeather: GetCurrentWeatherUsecase = GetCurrentWeatherUsecase(),
        getDailyForecast: GetDailyForecastUsecase = GetDailyForecastUsecase(),
        getLocation: GetLocationUsecase = GetLocationUsecase(),
        locationService: LocationService? = nil,
        networkMonitor: NetworkMonitor = .shared
    ) {
        self.query = query
        self.getCurrentWeather = getCurrentWeather
        self.getDailyForecast = getDailyForecast
        self.getLocation = getLocation
        self.locationService = locationService ?? LocationService()
        self.networkMonitor = networkMonitor

        let dao = WeatherCacheDAOImpl(context: context)
        let localDS = WeatherCacheLocalDatasourceImpl(dao: dao)
        let repo = WeatherCacheRepositoryImpl(localDataSource: localDS)
        self.saveCache = SaveWeatherCacheUsecase(repository: repo)
        self.loadCache = LoadWeatherCacheUsecase(repository: repo)
    }

    func loadWeatherForCurrentLocation() async {
        if let query {
           
            await loadWeather(query: query)
        } else {
            isLoading = true
            errorMessage = nil
            do {
                let coordinate = try await locationService.requestCurrentLocation()
                let q = "\(coordinate.latitude),\(coordinate.longitude)"
                
             
                await loadWeather(query: q, cacheKey: "CurrentLocation")
                
            } catch {
               
                if let cached = try? loadCache.execute(query: "CurrentLocation") {
                    apply(current: cached.current, daily: cached.daily, location: cached.location)
                    isShowingCachedData = true
                } else {
                    errorMessage = "Couldn't get your location. \(error.localizedDescription)"
                }
                isLoading = false
            }
        }
    }

    func refresh() async {
        await loadWeatherForCurrentLocation()
    }


    private func loadWeather(query: String, cacheKey: String? = nil) async {
     
        let actualCacheKey = cacheKey ?? query
        
        isLoading = true
        errorMessage = nil

        guard networkMonitor.isConnected else {
            isShowingCachedData = true
         
            if let cached = try? loadCache.execute(query: actualCacheKey) {
                apply(current: cached.current, daily: cached.daily, location: cached.location)
            } else {
                errorMessage = "No internet connection and no cached data available."
            }
            isLoading = false
            return
        }

        isShowingCachedData = false
        do {
            
            let current = try await getCurrentWeather.execute(query: query)
            let daily = try await getDailyForecast.execute(query: query, days: 3)
            let resolvedLocation = try await getLocation.execute(query: query)

          
            try? saveCache.execute(
                query: actualCacheKey,
                current: current,
                daily: daily,
                location: resolvedLocation
            )

            apply(current: current, daily: daily, location: resolvedLocation)
        } catch {
          
            if let cached = try? loadCache.execute(query: actualCacheKey) {
                apply(current: cached.current, daily: cached.daily, location: cached.location)
                isShowingCachedData = true
            } else {
                errorMessage = "Couldn't load weather. \(error.localizedDescription)"
            }
        }

        isLoading = false
    }

    private func apply(current: CurrentWeather, daily: [DailyForecast], location: Location) {
        self.currentWeather = current
        self.location = location
        self.dailyForecastItems = daily.map { DailyForecastItem(from: $0) }
        self.sunTimes = daily.first.map { ($0.sunrise, $0.sunset) }
        self.greeting = Self.greeting()
        self.currentDateTimeString = Self.currentDateTimeString()
        self.conditionIcon = Self.conditionIcon(for: current)
        if let first = daily.first {
            self.sunProgress = Self.calculateSunProgress(sunrise: first.sunrise, sunset: first.sunset)
        }
        self.uvRoundedValue = Int(current.uvIndex.rounded())
        self.uvLabel = Self.uvLabel(for: current.uvIndex)
        self.uvPercent = min(current.uvIndex / 11.0, 1.0)
    }
    private static func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good Morning"
        case 12..<17: return "Good Afternoon"
        case 17..<21: return "Good Evening"
        default:      return "Good Night"
        }
    }

    private static func currentDateTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, d MMM  •  hh:mm a"
        return formatter.string(from: Date())
    }

    private static func conditionIcon(for weather: CurrentWeather) -> String {
        let text = weather.conditionText.lowercased()
        let isNight = !weather.isDaytime
        if text.contains("rain") || text.contains("drizzle") { return "cloud.rain.fill" }
        if text.contains("snow") { return "cloud.snow.fill" }
        if text.contains("cloud") || text.contains("overcast") || text.contains("mist") || text.contains("fog") {
            return isNight ? "cloud.moon.fill" : "cloud.fill"
        }
        return isNight ? "moon.stars.fill" : "sun.max.fill"
    }

    private static func calculateSunProgress(sunrise: String, sunset: String) -> Double {
        guard let sunriseDate = timeOnly(sunrise), let sunsetDate = timeOnly(sunset) else { return 0.5 }
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let nowString = formatter.string(from: Date())
        let now = timeOnly(nowString) ?? sunriseDate
        let total = sunsetDate.timeIntervalSince(sunriseDate)
        guard total > 0 else { return 0.5 }
        return min(max(now.timeIntervalSince(sunriseDate) / total, 0), 1)
    }

    private static func timeOnly(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.date(from: string)
    }

    private static func uvLabel(for uvIndex: Double) -> String {
        switch uvIndex {
        case ..<3:   return "Low"
        case 3..<6:  return "Moderate"
        case 6..<8:  return "High"
        case 8..<11: return "Very High"
        default:     return "Extreme"
        }
    }
}
