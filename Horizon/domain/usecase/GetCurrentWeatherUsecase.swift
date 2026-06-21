//
//  GetCurrentWeatherUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import Foundation
struct GetCurrentWeatherUsecase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository = WeatherRepositoryImpl()) {
        self.repository = repository
    }

    func execute(query: String) async throws -> CurrentWeather {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw URLError(.badURL)
        }
        return try await repository.getCurrentWeather(query: query)
    }
}
