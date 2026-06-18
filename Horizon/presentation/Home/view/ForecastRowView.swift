//
//  ForecastRowView.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI

struct ForecastRowView: View {
    let day: ForecastDay

    var body: some View {
        HStack {
            Text(day.name)
                .font(AppFont.weatherRowText)
                .foregroundColor(.textPrimary)

            Spacer()

            Image(systemName: day.icon)
                .font(.system(size: 24))
                .foregroundColor(.accentBlue)

            Spacer()

            Text("\(day.high)° / \(day.low)°")
                .font(AppFont.weatherRowText)
                .foregroundColor(.textPrimary)
        }
    }
}

/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        ForecastRowView(day: ForecastDay(name: "Tomorrow", icon: "cloud.sleet.fill", high: 15, low: 9))
            .padding()
    }
}*/
