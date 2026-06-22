//
//  WeatherStatGrid.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import SwiftUI

struct WeatherStatGrid: View {
    let currentWeather: CurrentWeather?

    private var skyStats: [WeatherStat] {
        guard let currentWeather else { return [] }
        return [
            WeatherStat(title: "CLOUD", value: "\(currentWeather.cloudCoveragePercentage)%", icon: "cloud.fill", iconColor: .accentBlue),
            WeatherStat(title: "HUMIDITY", value: "\(currentWeather.humidityPercentage)%", icon: "drop.fill", iconColor: .rainBlue),
            WeatherStat(title: "WIND", value: String(format: "%.1f m/s", currentWeather.windSpeedMps), icon: "wind", iconColor: .moonPurple)
        ]
    }

    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var body: some View {
        if !skyStats.isEmpty {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(skyStats) { stat in
                    StatCardView(stat: stat)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

