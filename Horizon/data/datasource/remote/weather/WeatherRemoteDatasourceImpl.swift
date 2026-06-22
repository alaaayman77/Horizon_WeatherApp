//
//  WeatherRemoteDatasourceImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import Foundation
class WeatherRemoteDatasourceImpl: WeatherRemoteDataSource {
    private let weatherService: WeatherService

    init(weatherService: WeatherService = WeatherService()) {
        self.weatherService = weatherService
    }

    func getCurrentWeather(query: String) async throws -> CurrentWeatherDTO {
        let response = try await weatherService.fetchForecast(query: query, days: 1)
        return response.current
    }

    func getDailyForecast(query: String, days: Int) async throws -> [ForecastDayDTO] {
        let response = try await weatherService.fetchForecast(query: query, days: days)
        return response.forecast.forecastday
    }

    func getHourlyForecast(query: String) async throws -> [HourlyWeatherDTO] {
        let response = try await weatherService.fetchForecast(query: query, days: 1)

        guard let todayForecast = response.forecast.forecastday.first else {
            throw URLError(.badServerResponse)
        }

        return todayForecast.hour
    }

    func getWeatherStats(query: String) async throws -> CurrentWeatherDTO {
        try await getCurrentWeather(query: query)
    }

    func getLocation(query: String) async throws -> LocationDTO {
     
        let response = try await weatherService.fetchForecast(query: query, days: 1)
        return response.location
    }
}
