//
//  ForecastDay.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import Foundation

struct DailyForecastItem: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let high: Int
    let low: Int
    let hourlyForecasts: [HourlyForecast]

    init(from forecast: DailyForecast) {
        self.name = Self.dayLabel(for: forecast.date)
        self.icon = Self.systemIcon(forIconURL: forecast.conditionIconURLString)
        self.high = Int(forecast.maxTemperatureCelsius.rounded())
        self.low = Int(forecast.minTemperatureCelsius.rounded())
        self.hourlyForecasts = forecast.hourlyForecasts
    }

    private static func dayLabel(for date: Date) -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) { return "Today" }
        if calendar.isDateInTomorrow(date) { return "Tomorrow" }
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }

    private static func systemIcon(forIconURL url: String) -> String {
        if url.contains("rain") || url.contains("drizzle") { return "cloud.rain.fill" }
        if url.contains("snow") { return "cloud.snow.fill" }
        if url.contains("cloud") || url.contains("overcast") { return "cloud.sun.fill" }
        return "sun.max.fill"
    }
}
