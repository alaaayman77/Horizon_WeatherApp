//
//  HourlyForecastScreenView.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//



import SwiftUI

struct HourlyForecastScreenView: View {
    @StateObject private var viewModel: HourlyForecastViewModel
    @ObservedObject private var networkMonitor = NetworkMonitor.shared
    @Environment(\.dismiss) private var dismiss

    init(day: DailyForecastItem) {
        _viewModel = StateObject(wrappedValue: HourlyForecastViewModel(day: day))
    }

    private var backgroundImage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        return (hour >= 6 && hour < 20) ? "light" : "night"
    }

    var body: some View {
        ZStack {
            Image(backgroundImage)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.deepNavy.opacity(0.35)
                .ignoresSafeArea()

            VStack(spacing: 0) {
                HourlyForecastHeader(onBack: { dismiss() })

                if !networkMonitor.isConnected {
                    NoInternetBannerView {
                        dismiss()
                    }
                }

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
