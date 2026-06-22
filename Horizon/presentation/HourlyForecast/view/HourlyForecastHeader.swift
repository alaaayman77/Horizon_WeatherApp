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
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(.white)
                }

                Image(systemName: "clock")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    
                Text("HOURLY FORECAST")
                    .font(AppFont.h1)
                    .foregroundColor(.white)
                    
            }
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
        HourlyForecastHeader(onBack: {})
    }
}*/
