//
//  DailyForecast.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import Foundation
struct DailyForecast {
    let date: Date
    let maxTemperatureCelsius: Double
    let minTemperatureCelsius: Double
    let conditionText: String
    let conditionIconURLString: String
    let sunrise: String
    let sunset: String
    let hourlyForecasts: [HourlyForecast]
}
