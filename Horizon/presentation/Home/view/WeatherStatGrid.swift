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

        var stats: [WeatherStat] = [
            WeatherStat(title: "CLOUD",      value: "\(currentWeather.cloudCoveragePercentage)%",            icon: "cloud.fill",   iconColor: .accentBlue),
            WeatherStat(title: "HUMIDITY",   value: "\(currentWeather.humidityPercentage)%",                 icon: "drop.fill",    iconColor: .rainBlue),
            WeatherStat(title: "WIND",       value: String(format: "%.1f m/s", currentWeather.windSpeedMps), icon: "wind",         iconColor: .moonPurple),
            WeatherStat(title: "VISIBILITY", value: String(format: "%.0f km",  currentWeather.visibilityKm), icon: "eye.fill",     iconColor: .accentBlue),
            WeatherStat(title: "PRESSURE",   value: String(format: "%.0f hPa", currentWeather.pressureHpa),  icon: "gauge.medium", iconColor: .rainBlue)
        ]

        if let aqi = currentWeather.airQualityIndex {
            stats.append(
                WeatherStat(
                    title: "AIR QUALITY",
                    value: aqiLabel(for: aqi),
                    icon: "aqi.medium",
                    iconColor: aqiColor(for: aqi)
                )
            )
        }

        return stats
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

    
    private func aqiLabel(for index: Int) -> String {
        switch index {
        case 1: return "Good"
        case 2: return "Moderate"
        case 3: return "Unhealthy*"
        case 4: return "Unhealthy"
        case 5: return "Very Poor"
        case 6: return "Hazardous"
        default: return "Unknown"
        }
    }

    private func aqiColor(for index: Int) -> Color {
        switch index {
        case 1: return .green
        case 2: return .yellow
        case 3: return .orange
        case 4: return .red
        case 5: return .purple
        case 6: return .moonPurple
        default: return .accentBlue
        }
    }
}
