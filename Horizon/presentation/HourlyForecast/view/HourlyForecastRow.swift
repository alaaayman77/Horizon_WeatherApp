//
//  HourlyForecastRow.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI
struct HourlyRowView: View {
    let hour: HourlyForecast
 
    var body: some View {
        HStack {
            Text(hour.time)
                .font(AppFont.h3)
                .foregroundColor(.textPrimary)
 
            Spacer()
 
            Image(systemName: hour.icon)
                .font(.system(size: 28))
                .foregroundColor(.accentBlue)
 
            Spacer()
 
            Text("\(hour.temperature)°")
                .font(AppFont.weatherStatValue)
                .foregroundColor(.textPrimary)
        }
        .padding(.vertical, 18)
    }
}
 
/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        HourlyRowView(hour: HourlyForecast(time: "Now", icon: "cloud.moon.fill", temperature: 13))
            .padding()
    }
}*/
