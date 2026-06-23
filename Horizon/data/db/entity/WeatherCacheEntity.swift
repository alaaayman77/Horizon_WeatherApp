//
//  WeatherCacheEntity.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//

import Foundation
import SwiftData

@Model
final class WeatherCacheEntity {
    @Attribute(.unique) var query: String
    var cachedAt: Date
    var weatherJSON: Data

    init(query: String, weatherJSON: Data, cachedAt: Date = .now) {
        self.query = query
        self.weatherJSON = weatherJSON
        self.cachedAt = cachedAt
    }
}
