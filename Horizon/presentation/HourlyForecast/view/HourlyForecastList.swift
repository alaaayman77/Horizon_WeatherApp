//
//  HourlyForecastList.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//


import SwiftUI

struct HourlyForecastListView: View {

    let hours: [HourlyForecast] = [
        HourlyForecast(time: "Now",   icon: "cloud.moon.fill", temperature: 13),
        HourlyForecast(time: "10 PM", icon: "moon.fill", temperature: 12),
        HourlyForecast(time: "11 PM", icon: "cloud.moon.fill", temperature: 11),
        HourlyForecast(time: "12 AM", icon: "moon.fill", temperature: 10),
        HourlyForecast(time: "1 AM",  icon: "moon.fill", temperature: 10),
        HourlyForecast(time: "2 AM",  icon: "cloud.moon.fill", temperature: 9)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(Array(hours.enumerated()), id: \.element.id) { index, hour in
                HourlyRowView(hour: hour)

                if index < hours.count - 1 {
                    Divider()
                        .background(Color.white.opacity(0.15))
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        HourlyForecastListView()
    }
}*/
