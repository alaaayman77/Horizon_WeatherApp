//
//  LocationMapper.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import Foundation
extension LocationDTO {
    func toEntity() -> Location {
        return Location(
            cityName: name,
            region: region,
            country: country,
            latitude: lat,
            longitude: lon,
            localTime: Date(timeIntervalSince1970: TimeInterval(localtimeEpoch))
        )
    }
    
    
}


extension Location {
    func toDTO() -> LocationDTO {
        return LocationDTO(
            name: cityName,
            region: region,
            country: country,
            lat: latitude,
            lon: longitude,
            tzId: "",
            localtimeEpoch: Int(localTime.timeIntervalSince1970)
        )
    }
}
