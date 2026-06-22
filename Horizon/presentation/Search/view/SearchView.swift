//
//  SearchView.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

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
                        Task { await viewModel.loadCountries() }
                    }
                    .foregroundColor(.textOnPhoto)
                    .padding(.top, 8)
                    Spacer()
                } else if viewModel.isSearching && viewModel.filteredCountries.isEmpty {
                    Spacer()
                    Text("No results for \"\(viewModel.query)\"")
                        .font(AppFont.body)
                        .foregroundColor(.textOnPhotoSecondary)
                    Spacer()
                } else {
                    List {
                        ForEach(Array(viewModel.displayedCountries.enumerated()), id: \.element.id) { index, country in
                            VStack(spacing: 0) {
                                
                                
                                ZStack(alignment: .leading) {
                             
                                    NavigationLink(destination: HomeView(query: country.query)) {
                                        EmptyView()
                                    }
                                    .opacity(0)
                                    
                                   
                                    LocationRowView(
                                        icon: country.flagEmoji,
                                        title: country.name,
                                        subtitle: country.code
                                    )
                                }
                                
                               
                                if index < viewModel.displayedCountries.count - 1 {
                                    Divider()
                                        .background(Color.cardStroke)
                                }
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)) //
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .contentMargins(.horizontal, 0)
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
        }
        .task {
            await viewModel.loadCountries()
        }
    }
}
