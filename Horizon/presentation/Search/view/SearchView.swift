//
//  SearchView.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//

import SwiftUI
import SwiftData

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @Environment(\.modelContext) private var context
    @State private var selectedQuery: String? = nil

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SearchBarView(
                    query: $viewModel.query,
                    onClear: { viewModel.clearQuery() }
                )
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 12)

                if viewModel.isLoading {
                    Spacer()
                    ProgressView().tint(.white)
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    Spacer()
                    Text(error)
                        .font(AppFont.body)
                        .foregroundColor(.textOnPhotoSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    Button("Retry") {
                        Task { await viewModel.loadCountries(context: context) }
                    }
                    .foregroundColor(.textOnPhoto)
                    .padding(.top, 8)
                    Spacer()
                } else if viewModel.isSearching && viewModel.displayedCountries.isEmpty {
                    Spacer()
                    Text("No results for \"\(viewModel.query)\"")
                        .font(AppFont.body)
                        .foregroundColor(.textOnPhotoSecondary)
                    Spacer()
                } else {
                    List {
                        ForEach(Array(viewModel.displayedCountries.enumerated()), id: \.element.query) { index, countryItem in
                            VStack(spacing: 0) {
                                LocationRowView(
                                    icon: countryItem.flagEmoji,
                                    title: countryItem.name,
                                    subtitle: countryItem.code,
                                    isFavorite: countryItem.isFavorite,
                                    onFavoriteTapped: {
                                        viewModel.toggleFavorite(for: countryItem, context: context)
                                    }
                                )
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    selectedQuery = countryItem.query
                                }

                                if index < viewModel.displayedCountries.count - 1 {
                                    Divider()
                                        .background(Color.cardStroke)
                                }
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .contentMargins(.horizontal, 0)
                    .navigationDestination(item: $selectedQuery) { query in
                        HomeView(query: query)
                    }
                }
            }
            .background {
                ZStack {
                    Image("night")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    Color.deepNavy.opacity(0.4)
                        .ignoresSafeArea()
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .onAppear {
                if !viewModel.displayedCountries.isEmpty {
                    viewModel.syncFavorites(context: context)
                }
            }
            .onChange(of: viewModel.displayedCountries) { oldValue, newValue in
                if oldValue.count != newValue.count || oldValue.first?.query != newValue.first?.query {
                    viewModel.syncFavorites(context: context)
                }
            }
        }
        .task {
            await viewModel.loadCountries(context: context)
        }
    }
}
