//
//  HourlyForecastScreenView.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI

struct HourlyForecastScreenView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Image("night")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.deepNavy.opacity(0.35)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HourlyForecastHeader(onBack: { dismiss() })

                HourlyForecastListView()
                Spacer()
           
            }
          
        }
    
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}

/*#Preview {
    NavigationStack {
        HourlyForecastScreenView()
    }
}*/
