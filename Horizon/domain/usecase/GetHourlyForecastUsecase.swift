//
//  GetHourlyForecastUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import Foundation
struct GetHourlyForecastUsecase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository = WeatherRepositoryImpl()) {
        self.repository = repository
    }

    func execute(query: String) async throws -> [HourlyForecast] {
        return try await repository.getHourlyForecast(query: query)
    }
}
