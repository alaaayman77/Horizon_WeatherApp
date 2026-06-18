//
//  HourlyForecastHeader.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//


import SwiftUI

struct HourlyForecastHeader: View {
    var onBack: () -> Void = {}

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 20) {
                Button(action: onBack) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.textPrimary)
                }

                Text("Hourly Forecast")
                    .font(AppFont.h1)
                    .foregroundColor(.textPrimary)
            }

            Spacer()

            
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        HourlyForecastHeaderView()
    }
}*/
