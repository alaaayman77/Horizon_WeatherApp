//
//  HourlyForecastViewModel.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

@MainActor
final class HourlyForecastViewModel: ObservableObject {
    @Published private(set) var hours: [HourlyForecastItem] = []
    let dayName: String

    init(day: DailyForecastItem) {
        self.dayName = day.name
        self.hours = Self.filteredHours(from: day)
    }

    private static func filteredHours(from day: DailyForecastItem) -> [HourlyForecastItem] {
        let isToday = day.name == "Today"

        if isToday {
            let currentHour = Calendar.current.component(.hour, from: Date())
            let fromNow = day.hourlyForecasts.filter { forecast in
                Calendar.current.component(.hour, from: forecast.time) >= currentHour
            }
            return fromNow.map { HourlyForecastItem(from: $0) }
        } else {
            return day.hourlyForecasts.map { HourlyForecastItem(from: $0) }
        }
    }
}
