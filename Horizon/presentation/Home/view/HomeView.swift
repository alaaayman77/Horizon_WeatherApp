//
//  HomeView.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//


import SwiftUI
import SwiftData


struct HomeView: View {
    @Environment(\.modelContext) private var context
    let query: String?

    init(query: String? = nil) {
        self.query = query
    }

    var body: some View {
        HomeContentView(query: query, context: context)
    }
}


private struct HomeContentView: View {
    @StateObject private var viewModel: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    let query: String?

    init(query: String?, context: ModelContext) {
        self.query = query
        _viewModel = StateObject(
            wrappedValue: HomeViewModel(query: query, context: context)
        )
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Image("night")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                if viewModel.isLoading && viewModel.currentWeather == nil {
                    ProgressView().tint(.white)

                } else if let errorMessage = viewModel.errorMessage,
                          viewModel.currentWeather == nil {
                    VStack(spacing: 12) {
                        Image(systemName: "wifi.slash")
                            .font(.system(size: 40))
                            .foregroundColor(.textOnPhotoSecondary)
                        Text(errorMessage)
                            .font(AppFont.body)
                            .foregroundColor(.textOnPhoto)
                            .multilineTextAlignment(.center)
                        Button("Try Again") {
                            Task { await viewModel.loadWeatherForCurrentLocation() }
                        }
                        .foregroundColor(.textOnPhoto)
                    }
                    .padding(.horizontal, 30)

                } else {
                    VStack(spacing: 0) {
                        if query != nil {
                            HStack {
                                Button(action: { dismiss() }) {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 22, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 10)
                                }
                                Spacer()
                            }
                        }

                        if viewModel.isShowingCachedData {
                            NoInternetBannerView {
                                Task { await viewModel.refresh() }
                            }
                        }

                        ScrollView {
                            VStack(spacing: 20) {
                                HomeHeaderView(
                                    greeting: viewModel.greeting,
                                    dateTimeString: viewModel.currentDateTimeString,
                                    cityName: viewModel.location?.region ?? "Locating...",
                                    districtName: viewModel.location?.cityName,
                                    conditionIcon: viewModel.conditionIcon,
                                    currentWeather: viewModel.currentWeather
                                )
                                DailyForecastList(days: viewModel.dailyForecastItems)
                                WeatherStatGrid(currentWeather: viewModel.currentWeather)

                                if let sunTimes = viewModel.sunTimes {
                                    SunTimesView(
                                        sunrise: sunTimes.sunrise,
                                        sunset: sunTimes.sunset,
                                        progress: viewModel.sunProgress
                                    )
                                }
                                if viewModel.currentWeather != nil {
                                    UVIndexView(
                                        roundedValue: viewModel.uvRoundedValue,
                                        label: viewModel.uvLabel,
                                        percent: viewModel.uvPercent
                                    )
                                }
                            }
                            .padding(.top, query != nil ? 10 : 20)
                            .padding(.bottom, 30)
                        }
                        .refreshable {
                            await viewModel.refresh()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .toolbar(.hidden, for: .navigationBar)
            .task {
                await viewModel.loadWeatherForCurrentLocation()
            }
        }
    }
}
