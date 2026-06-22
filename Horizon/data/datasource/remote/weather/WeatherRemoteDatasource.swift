//
//  WeatherRemoteDatasource.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import Foundation



protocol WeatherRemoteDataSource {
    func getCurrentWeather(query: String) async throws -> CurrentWeatherDTO
    func getDailyForecast(query: String, days: Int) async throws -> [ForecastDayDTO]
    func getHourlyForecast(query: String) async throws -> [HourlyWeatherDTO]
    func getWeatherStats(query: String) async throws -> CurrentWeatherDTO
    func getLocation(query: String) async throws -> LocationDTO
}
