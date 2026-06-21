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
        NavigationStack{
            
       
        VStack(alignment: .leading, spacing: 14) {
            Text("3-DAY FORECAST")
                .font(AppFont.h2)
                .foregroundColor(.textPrimary)

            VStack(spacing: 0) {
                ForEach(Array(days.enumerated()), id: \.element.id) { index, day in
                    NavigationLink(destination : HourlyForecastScreenView()){
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
    }
