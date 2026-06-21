//
//  HourlyForecastRow.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI

struct HourlyRowView: View {
    let hour: HourlyForecastItem
 
    var body: some View {
        HStack {
            Text(hour.time)
                .font(AppFont.weatherRowText)
                .foregroundColor(.white )
 
            Spacer()
 
            Image(systemName: hour.icon)
                .font(.system(size: 22))
                .foregroundColor(hour.isNow ? .white : .sunYellow)
 
            Spacer()
 
            Text("\(hour.temperature)°C")
                .font(AppFont.weatherStatValue)
                .foregroundColor(.white )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(hour.isNow ? Color.navy : Color.clear)
        )
    }
}
