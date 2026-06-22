//
//  HourlyForecastList.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import SwiftUI

struct HourlyForecastListView: View {
    let hours: [HourlyForecastItem]

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
    }
}
