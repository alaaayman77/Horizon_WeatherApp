//
//  CurrentWeatherMapper.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
extension CurrentWeatherDTO {
    func toEntity() -> CurrentWeather {
        return CurrentWeather(
            temperatureCelsius: tempC,
            conditionText: condition.text,
            conditionIconURLString: formatIconURL(condition.icon),
            feelsLikeCelsius: feelslikeC,
            humidityPercentage: humidity,
            windSpeedMps: windKph / 3.6,
            pressureHpa: pressureMb,
            visibilityKm: visKm,
            uvIndex: uv,
            cloudCoveragePercentage: cloud,
            isDaytime: isDay == 1
        )
    }
}

func formatIconURL(_ rawURL: String) -> String {
    return rawURL.hasPrefix("//") ? "https:\(rawURL)" : rawURL
}

extension CurrentWeather {
    func toDTO() -> CurrentWeatherDTO {
        return CurrentWeatherDTO(
            tempC: temperatureCelsius,
            isDay: isDaytime ? 1 : 0,
            condition: ConditionDTO(
                text: conditionText,
                icon: conditionIconURLString
            ),
            pressureMb: pressureHpa,
            humidity: humidityPercentage,
            feelslikeC: feelsLikeCelsius,
            visKm: visibilityKm,
            uv: uvIndex,
            windKph: windSpeedMps * 3.6,
            cloud: cloudCoveragePercentage,
            airQuality: nil
        )
    }
}

