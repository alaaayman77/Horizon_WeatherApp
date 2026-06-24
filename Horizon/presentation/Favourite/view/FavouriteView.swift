//
//  FavouriteView.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//


import SwiftUI
import SwiftData

struct FavouriteView: View {
    @StateObject private var viewModel: FavouriteViewModel = FavouriteViewModel()
    @ObservedObject private var networkMonitor = NetworkMonitor.shared
    @Environment(\.modelContext) private var context
    @State private var selectedQuery: String? = nil

    private var backgroundImage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        return (hour >= 6 && hour < 20) ? "light" : "night"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Image(backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                Color.deepNavy.opacity(0.4)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    if !networkMonitor.isConnected {
                        NoInternetBannerView { }
                    }

                    HStack {
                        Text("Favourites")
                            .font(AppFont.h1)
                            .foregroundColor(.textOnPhoto)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    .padding(.bottom, 12)

                    if viewModel.favoriteLocations.isEmpty {
                        Spacer()
                        VStack(spacing: 8) {
                            Image(systemName: "heart.slash")
                                .font(.system(size: 40))
                                .foregroundColor(.textOnPhotoSecondary)
                            Text("No Favourites Added Yet")
                                .font(AppFont.body)
                                .foregroundColor(.textOnPhotoSecondary)
                        }
                        Spacer()
                    } else {
                        List {
                            ForEach(Array(viewModel.favoriteLocations.enumerated()), id: \.element.query) { index, favorite in
                                VStack(spacing: 0) {
                                    LocationRowView(
                                        icon: favorite.flagEmoji,
                                        title: favorite.name,
                                        subtitle: favorite.code,
                                        isFavorite: true,
                                        onFavoriteTapped: {
                                            viewModel.requestDelete(query: favorite.query)
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        selectedQuery = favorite.query
                                    }

                                    if index < viewModel.favoriteLocations.count - 1 {
                                        Divider()
                                            .background(Color.cardStroke)
                                    }
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button(role: .destructive) {
                                        viewModel.requestDelete(query: favorite.query)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
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
            }
            .navigationBarHidden(true)
            .toolbar(.hidden, for: .navigationBar)
         
            .alert(
                "Remove Favourite",
                isPresented: Binding(
                    get: { viewModel.pendingDeleteQuery != nil },
                    set: { if !$0 { viewModel.cancelDelete() } }
                )
            ) {
                Button("Remove", role: .destructive) {
                    viewModel.confirmDelete(context: context)
                }
                Button("Cancel", role: .cancel) {
                    viewModel.cancelDelete()
                }
            } message: {
                if let query = viewModel.pendingDeleteQuery {
                    Text("Remove \(viewModel.name(for: query)) from your favourites?")
                }
            }
        }
        .onAppear {
            viewModel.loadFavorites(context: context)
        }
    }
}
