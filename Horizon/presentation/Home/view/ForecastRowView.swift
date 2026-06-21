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
                .foregroundColor(.textSecondary)
            Spacer()
            Image(systemName: day.icon)
                .font(.system(size: 22))
                .foregroundColor(.sunYellow)
            Spacer()
            Text("\(day.high)° / \(day.low)°")
                .font(AppFont.weatherRowText)
                .foregroundColor(.textPrimary)
        }
    }
}
