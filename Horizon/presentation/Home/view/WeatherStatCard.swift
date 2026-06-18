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
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text(stat.title)
                    .font(AppFont.weatherStatLabel)
                    .foregroundColor(.textSecondary)

                Spacer()

                Image(systemName: stat.icon)
                    .font(.system(size: 22))
                    .foregroundColor(.accentBlue)
            }

            Text(stat.value)
                .font(AppFont.weatherStatValue)
                .foregroundColor(.textPrimary)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.cardFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.cardStroke, lineWidth: 1)
                )
        )
    }
}

/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        StatCardView(stat: WeatherStat(title: "Humidity", value: "85%", icon: "drop.fill"))
            .padding()
    }
}*/
