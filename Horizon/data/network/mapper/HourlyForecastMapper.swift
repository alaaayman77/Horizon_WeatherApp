//
//  HourlyForecastMapper.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import Foundation
extension HourlyWeatherDTO {
    func toEntity() -> HourlyForecast {
        return HourlyForecast(
            time: Date(timeIntervalSince1970: TimeInterval(timeEpoch)),
            temperatureCelsius: tempC,
            conditionIconURLString: formatIconURL(condition.icon),
            chanceOfRainPercentage: chanceOfRain
        )
    }
}
extension HourlyForecast {
    func toDTO() -> HourlyWeatherDTO {
        return HourlyWeatherDTO(
            timeEpoch: Int(time.timeIntervalSince1970),
            tempC: temperatureCelsius,
            condition: ConditionDTO(
                text: "",
                icon: conditionIconURLString
            ),
            chanceOfRain: chanceOfRainPercentage
        )
    }
}
