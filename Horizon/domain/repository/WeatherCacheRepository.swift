//
//  WeatherCacheRepository.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//



import Foundation

protocol WeatherCacheRepository {
    func saveWeather(query: String, current: CurrentWeather, daily: [DailyForecast], location: Location) throws
    func loadWeather(query: String) throws -> (current: CurrentWeather, daily: [DailyForecast], location: Location)?
}
