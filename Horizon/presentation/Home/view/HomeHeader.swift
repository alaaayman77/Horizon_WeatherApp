//
//  HomeHeader.swift
//  Horizon
//
//  Created by Alaa Ayman on 15/06/2026.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Good Morning")
                        .font(AppFont.h2)
                        .foregroundColor(.textOnPhoto)

                    Text("Tue, 17 Mar  •  09:24 AM")
                        .font(AppFont.caption)
                        .foregroundColor(.textOnPhotoSecondary)
                }

                Spacer()

                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                        .font(.system(size: 10))
                    Text("Alexandria Gov...")
                        .font(AppFont.caption)
                }
                .foregroundColor(.pillText)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Capsule().fill(Color.pillFill))
            }

            Text("Al Qasaei Bahri, El Raml 1")
                .font(AppFont.h1)
                .foregroundColor(.textOnPhoto)

            VStack(spacing: 4) {
                Image(systemName: "cloud.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 48)
                    .foregroundColor(.textOnPhotoSecondary)

                Text("15 °C")
                    .font(AppFont.largeHeader)
                    .foregroundColor(.textOnPhoto)

                Text("Mist")
                    .font(AppFont.body)
                    .foregroundColor(.textOnPhotoSecondary)

                HStack(spacing: 10) {
                    hiLoPill(icon: "arrow.up", value: "H: 15°C")
                    hiLoPill(icon: "arrow.down", value: "L: 8°C")
                }
                .padding(.top, 6)

                HStack(spacing: 6) {
                    Image(systemName: "thermometer")
                        .font(.system(size: 11))
                    Text("Feels like 15 °C")
                        .font(AppFont.weatherStatLabel)
                }
                .foregroundColor(.textOnPhotoSecondary)
                .padding(.top, 4)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }

    private func hiLoPill(icon: String, value: String) -> some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
                .font(.system(size: 9, weight: .bold))
            Text(value)
                .font(AppFont.weatherStatLabel)
        }
        .foregroundColor(.pillText)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Capsule().fill(Color.pillFill))
    }
}

