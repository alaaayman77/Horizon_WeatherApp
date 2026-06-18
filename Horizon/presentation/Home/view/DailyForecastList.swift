//
//  DailyForecastList.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI

struct DailyForecastList: View {

    let days: [ForecastDay] = [
        ForecastDay(name: "Tomorrow", icon: "cloud.sleet.fill", high: 15, low: 9),
        ForecastDay(name: "Thursday", icon: "cloud.sun.fill", high: 18, low: 11),
        ForecastDay(name: "Friday", icon: "sun.max.fill", high: 20, low: 12)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("3-DAY FORECAST")
                .font(AppFont.caption)
                .foregroundColor(.textTertiary)
                .padding(.bottom, 16)

            ForEach(Array(days.enumerated()), id: \.element.id) { index, day in
                            NavigationLink {
                                HourlyForecastScreenView()
                            } label: {
                                ForecastRowView(day: day)
                            }
                            .buttonStyle(.plain)
             

                if index < days.count - 1 {
                    Divider()
                        .background(Color.white.opacity(0.1))
                        .padding(.vertical, 14)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.cardFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.cardStroke, lineWidth: 1)
                )
        )
        .padding(.horizontal, 20)
    }
}

/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        DailyForecastView()
    }
}*/
