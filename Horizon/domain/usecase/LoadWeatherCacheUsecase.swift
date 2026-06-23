//
//  LoadWeatherCacheUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//


import Foundation

final class LoadWeatherCacheUsecase {
    private let repository: WeatherCacheRepository

    init(repository: WeatherCacheRepository) {
        self.repository = repository
    }

    func execute(query: String) throws -> (current: CurrentWeather, daily: [DailyForecast], location: Location)? {
        return try repository.loadWeather(query: query)
    }
}
