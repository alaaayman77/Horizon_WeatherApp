//
//  HourlyForecast.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import Foundation

struct HourlyForecastItem: Identifiable {
    let id = UUID()
    let time: String
    let iconURL: String
    let sfIcon: String
    let temperature: Int
    let isNow: Bool

    init(from forecast: HourlyForecast) {
        let calendar = Calendar.current
        let isCurrentHour = calendar.isDate(forecast.time, equalTo: Date(), toGranularity: .hour)

        self.isNow = isCurrentHour
        self.time = isCurrentHour ? "Now" : Self.formattedHour(forecast.time)
        self.iconURL = forecast.conditionIconURLString   
        self.sfIcon = Self.systemIcon(forIconURL: forecast.conditionIconURLString)
        self.temperature = Int(forecast.temperatureCelsius.rounded())
    }

    private static func formattedHour(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }

    private static func systemIcon(forIconURL url: String) -> String {
        let isNight = url.contains("/night/")
        if url.contains("rain") || url.contains("drizzle") {
            return "cloud.rain.fill"
        } else if url.contains("snow") {
            return "cloud.snow.fill"
        } else if url.contains("cloud") || url.contains("overcast") {
            return isNight ? "cloud.moon.fill" : "cloud.fill"
        } else {
            return isNight ? "moon.fill" : "sun.max.fill"
        }
    }
}
