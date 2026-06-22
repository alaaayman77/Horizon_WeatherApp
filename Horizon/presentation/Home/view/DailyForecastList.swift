//
//  DailyForecastList.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import SwiftUI

struct DailyForecastList: View {
    let days: [DailyForecastItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("3-DAY FORECAST")
                .font(AppFont.h2)
                .foregroundColor(.textPrimary)

            if days.isEmpty {
                Text("No forecast available")
                    .font(AppFont.body)
                    .foregroundColor(.textSecondary)
            } else {
                VStack(spacing: 0) {
                    ForEach(Array(days.enumerated()), id: \.element.id) { index, day in
                        NavigationLink(destination: HourlyForecastScreenView(day: day)) {
                            ForecastRowView(day: day)
                        }
                        .padding(.vertical, 8)

                        if index < days.count - 1 {
                            Divider()
                                .background(Color.cardStroke)
                        }
                    }
                }
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.cardFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(Color.cardStroke, lineWidth: 1)
                )
        )
        .padding(.horizontal, 20)
    }
}
