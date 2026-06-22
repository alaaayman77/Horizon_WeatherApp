
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
                .foregroundColor(.white)

            Spacer()

            AsyncImage(url: URL(string: hour.iconURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                   
                    Image(systemName: hour.sfIcon)
                        .font(.system(size: 22))
                        .foregroundColor(.sunYellow)
                case .empty:
          
                    Image(systemName: hour.sfIcon)
                        .font(.system(size: 22))
                        .foregroundColor(.sunYellow.opacity(0.5))
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 36, height: 36)

            Spacer()

            Text("\(hour.temperature)°C")
                .font(AppFont.weatherStatValue)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(hour.isNow ? Color.navy : Color.clear)
        )
    }
}
