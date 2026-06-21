//
//  HourlyForecastList.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

import SwiftUI

struct HourlyForecastListView: View {
 
    let hours: [HourlyForecast] = [
        HourlyForecast(time: "Now",   icon: "sun.max.fill", temperature: 15, isNow: true),
        HourlyForecast(time: "10:00", icon: "sun.max.fill", temperature: 16, isNow: false),
        HourlyForecast(time: "11:00", icon: "cloud.fill",   temperature: 17, isNow: false),
        HourlyForecast(time: "12:00", icon: "cloud.fill",   temperature: 17, isNow: false),
        HourlyForecast(time: "13:00", icon: "sun.max.fill", temperature: 18, isNow: false)
    ]
 
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
           
 
            ForEach(Array(hours.enumerated()), id: \.element.id) { index, hour in
                HourlyRowView(hour: hour)
                    .frame(maxWidth: .infinity)
 
                if index < hours.count - 1 && !hour.isNow {
                    Divider()
                        .background(Color.cardStroke)
                        .padding(.vertical, 4)
                }
            }
        }
        .padding(20)
       
        .padding(.horizontal, 20)
    }
}
 
