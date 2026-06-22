//
//  FavouriteViewModel.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation
import SwiftData

@MainActor
final class FavouriteViewModel: ObservableObject {
    @Published private(set) var favoriteLocations: [FavoriteLocation] = []
    @Published var errorMessage: String?

    func loadFavorites(context: ModelContext) {
        let dao = FavoritesDAOImpl(context: context)
        let localDS = FavouriteLocalDatasourceImpl(dao: dao)
        let repo = FavouriteRepositoryImpl(localDataSource: localDS)
        let getFavorites = GetFavouriteUsecase(repository: repo)

        do {
            favoriteLocations = try getFavorites.execute()
        } catch {
            errorMessage = "Couldn't load your favorites."
        }
    }

    func remove(query: String, context: ModelContext) {
        let dao = FavoritesDAOImpl(context: context)
        let localDS = FavouriteLocalDatasourceImpl(dao: dao)
        let repo = FavouriteRepositoryImpl(localDataSource: localDS)
        let deleteFavorite = DeleteFavouriteUsecase(repository: repo)

        do {
            try deleteFavorite.execute(query: query)
            loadFavorites(context: context)
        } catch {
            errorMessage = "Failed to remove favorite."
        }
    }
}
