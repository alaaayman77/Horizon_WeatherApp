//
//  WeatherCacheRepositoryImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//


import Foundation

@MainActor
final class WeatherCacheRepositoryImpl: WeatherCacheRepository {
    private let localDataSource: WeatherCacheLocalDatasource

    init(localDataSource: WeatherCacheLocalDatasource) {
        self.localDataSource = localDataSource
    }

    func saveWeather(query: String, current: CurrentWeather, daily: [DailyForecast], location: Location) throws {
        let dto = WeatherResponseDTO(
            location: location.toDTO(),
            current: current.toDTO(),
            forecast: ForecastDTO(forecastday: daily.map { $0.toDTO() })
        )
        try localDataSource.saveCache(query: query, dto: dto)
    }

    func loadWeather(query: String) throws -> (current: CurrentWeather, daily: [DailyForecast], location: Location)? {
        guard let dto = try localDataSource.loadCache(query: query) else { return nil }

        let current = dto.current.toEntity()
        let daily = dto.forecast.forecastday.map { $0.toEntity() }
        let location = dto.location.toEntity()

        return (current, daily, location)
    }
}
