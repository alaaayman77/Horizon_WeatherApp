//
//  SaveWeatherCacheUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//



import Foundation

final class SaveWeatherCacheUsecase {
    private let repository: WeatherCacheRepository

    init(repository: WeatherCacheRepository) {
        self.repository = repository
    }

    func execute(query: String, current: CurrentWeather, daily: [DailyForecast], location: Location) throws {
        try repository.saveWeather(query: query, current: current, daily: daily, location: location)
    }
}
