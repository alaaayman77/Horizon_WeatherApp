//
//  HourlyForecastScreenView.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import SwiftUI

struct HourlyForecastScreenView: View {
    @StateObject private var viewModel: HourlyForecastViewModel
    @Environment(\.dismiss) private var dismiss

    init(day: DailyForecastItem) {
        _viewModel = StateObject(wrappedValue: HourlyForecastViewModel(day: day))
    }

    var body: some View {
        ZStack {
            Image("night")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.deepNavy.opacity(0.35)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HourlyForecastHeader( onBack: { dismiss() })

                ScrollView(showsIndicators: false) {
                    HourlyForecastListView(hours: viewModel.hours)
                }

                Spacer()
            }
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .navigationBar)
    }
}
