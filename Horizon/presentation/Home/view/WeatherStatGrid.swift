//
//  WeatherStatGrid.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI

struct WeatherStatGrid: View {
  
     let skyStats: [WeatherStat] = [
          WeatherStat(title: "CLOUD", value: "0%", icon: "cloud.fill", iconColor: .accentBlue),
          WeatherStat(title: "SUNRISE", value: "06:08 AM", icon: "sun.max.fill", iconColor: .sunYellow),
          WeatherStat(title: "SUNSET", value: "06:09 PM", icon: "moon.stars.fill", iconColor: .moonPurple)
      ]
 
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
 
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(skyStats) { stat in
                StatCardView(stat: stat)
            }
        }
        .padding(.horizontal, 20)
    }
}
 
/*#Preview {
    ZStack {
        Color.deepNavy.ignoresSafeArea()
        StatsGridView()
    }
}*/
