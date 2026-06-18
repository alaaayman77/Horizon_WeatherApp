//
//  WeatherStatGrid.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI
struct WeatherStatGrid: View {
 
    let stats: [WeatherStat] = [
        WeatherStat(title: "Visibility", value: "10 km", icon: "eye.fill"),
        WeatherStat(title: "Humidity", value: "85%", icon: "drop.fill"),
        WeatherStat(title: "Feels Like", value: "14°C", icon: "thermometer"),
        WeatherStat(title: "Pressure", value: "1012 hPa", icon: "gauge")
    ]
 
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
 
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(stats) { stat in
                StatCardView(stat: stat)
            }
        }
        .padding(.horizontal, 20)
    }
}
 
/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        StatsGridView()
    }
}*/
