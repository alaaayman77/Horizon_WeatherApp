//
//  GetWeatherStatUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import Foundation
struct GetWeatherStatUsecase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository = WeatherRepositoryImpl()) {
        self.repository = repository
    }

    func execute(query: String) async throws -> CurrentWeather {
        return try await repository.getWeatherStats(query: query)
    }
}
