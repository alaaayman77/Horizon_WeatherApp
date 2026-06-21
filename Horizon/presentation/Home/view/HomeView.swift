//
//  HomeView.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("night")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                        HomeHeaderView()
                        DailyForecastList()
                        WeatherStatGrid()
                        SunTimesView()
                        UVIndexView()
                              }
                              .padding(.top, 20)
                              .padding(.bottom, 30)
                          }
               
            }
        }
    }
}


#Preview{
    HomeView().preferredColorScheme(.dark)
}
