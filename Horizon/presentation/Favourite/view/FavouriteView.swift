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
    @Environment(\.modelContext) private var context
    @State private var selectedQuery: String? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                Image("night")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                Color.deepNavy.opacity(0.4)
                    .ignoresSafeArea()

                if viewModel.favoriteLocations.isEmpty {
                    VStack(spacing: 8) {
                        Image(systemName: "heart.slash")
                            .font(.system(size: 40))
                            .foregroundColor(.textOnPhotoSecondary)
                        Text("No Favourites Added Yet")
                            .font(AppFont.body)
                            .foregroundColor(.textOnPhotoSecondary)
                    }
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
                                        viewModel.remove(query: favorite.query, context: context)
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
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    viewModel.remove(query: favorite.query, context: context)
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
            .navigationBarHidden(true)
            .toolbar(.hidden, for: .navigationBar)
        }
        .onAppear {
            viewModel.loadFavorites(context: context)
        }
    }
}
