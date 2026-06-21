//
//  GetDailyForecastUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import Foundation
struct GetDailyForecastUsecase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository = WeatherRepositoryImpl()) {
        self.repository = repository
    }

    func execute(query: String, days: Int = 3) async throws -> [DailyForecast] {
        let targetDays = min(max(1, days), 14)
        return try await repository.getDailyForecast(query: query, days: targetDays)
    }
}
