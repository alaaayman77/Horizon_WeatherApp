//
//  WeatherStatCard.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI


struct StatCardView: View {
    let stat: WeatherStat

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(stat.iconColor.opacity(0.15))
                    .frame(width: 36, height: 36)

                Image(systemName: stat.icon)
                    .font(.system(size: 15))
                    .foregroundColor(stat.iconColor)
            }

            Text(stat.value)
                .font(AppFont.weatherStatValue)
                .foregroundColor(.textPrimary)

            Text(stat.title)
                .font(AppFont.caption)
                .foregroundColor(.textTertiary)
                .tracking(0.3)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(Color.cardFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Color.cardStroke, lineWidth: 1)
                )
        )
    }
}

