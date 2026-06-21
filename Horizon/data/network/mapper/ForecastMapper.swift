//
//  ForecastMapper.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import Foundation
extension ForecastDayDTO {
    func toEntity() -> DailyForecast {
        return DailyForecast(
            date: Date(timeIntervalSince1970: TimeInterval(dateEpoch)),
            maxTemperatureCelsius: day.maxtempC,
            minTemperatureCelsius: day.mintempC,
            conditionText: day.condition.text,
            conditionIconURLString: formatIconURL(day.condition.icon),
            sunrise: astro.sunrise,
            sunset: astro.sunset,
            hourlyForecasts: hour.map { $0.toEntity() }
        )
    }
}
