//
//  HomeHeader.swift
//  Horizon
//
//  Created by Alaa Ayman on 15/06/2026.
//


import SwiftUI

struct HomeHeaderView: View {
    let greeting: String
    let dateTimeString: String
    let cityName: String
    let districtName: String?
    let conditionIcon: String
    let currentWeather: CurrentWeather?
    let highTemp: Int?        
    let lowTemp: Int?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(greeting)
                        .font(AppFont.h2)
                        .foregroundColor(.textOnPhoto)
                    Text(dateTimeString)
                        .font(AppFont.caption)
                        .foregroundColor(.textOnPhotoSecondary)
                }
                Spacer()
                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                        .font(.system(size: 10))
                    Text(cityName)
                        .font(AppFont.caption)
                        .lineLimit(1)
                }
                .foregroundColor(.pillText)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color.pillFill))
            }

            if let districtName {
                Text(districtName)
                    .font(AppFont.h1)
                    .foregroundColor(.textOnPhoto)
            }

            VStack(spacing: 4) {
                Image(systemName: conditionIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 48)
                    .foregroundColor(.textOnPhotoSecondary)

                if let currentWeather {
                    Text("\(Int(currentWeather.temperatureCelsius.rounded())) °C")
                        .font(AppFont.largeHeader)
                        .foregroundColor(.textOnPhoto)

                    Text(currentWeather.conditionText)
                        .font(AppFont.body)
                        .foregroundColor(.textOnPhotoSecondary)

                    HStack(spacing: 6) {
                        Image(systemName: "thermometer")
                            .font(.system(size: 11))
                        Text("Feels like \(Int(currentWeather.feelsLikeCelsius.rounded())) °C")
                            .font(AppFont.weatherStatLabel)
                    }
                    .foregroundColor(.textOnPhotoSecondary)
                    .padding(.top, 4)

                    if let high = highTemp, let low = lowTemp {
                        HStack(spacing: 8) {
                            HiLoPill(icon: "arrow.up", value: "H: \(high)°")
                            HiLoPill(icon: "arrow.down",  value: "L: \(low)°")
                        }
                        .padding(.top, 6)
                    }

                } else {
                    Text("-- °C")
                        .font(AppFont.largeHeader)
                        .foregroundColor(.textOnPhoto)
                    Text("Loading weather...")
                        .font(AppFont.body)
                        .foregroundColor(.textOnPhotoSecondary)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }
}
