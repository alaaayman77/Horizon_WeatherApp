//
//  WeatherRepository.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//


protocol WeatherRepository {
    func getCurrentWeather(query: String) async throws -> CurrentWeather
    func getDailyForecast(query: String, days: Int) async throws -> [DailyForecast]
    func getHourlyForecast(query: String) async throws -> [HourlyForecast]
    func getWeatherStats(query: String) async throws -> CurrentWeather
    func getLocation(query: String) async throws -> Location
}
