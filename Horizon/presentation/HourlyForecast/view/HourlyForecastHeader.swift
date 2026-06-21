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
            HStack(spacing: 6) {
                Button(action: onBack) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.textPrimary)
                }

              
                    Image(systemName: "clock")
                        .font(.system(size: 20))
                        
                    Text("HOURLY FORECAST")
                        .font(AppFont.h1)
                        .foregroundColor(Color.white)
                        
                }
                .foregroundColor(.textSecondary)
                .padding(.bottom, 12)
                .padding(.horizontal, 4)
                  
            

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
