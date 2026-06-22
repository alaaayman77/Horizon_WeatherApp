//
//  FavouriteRepository.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//
@MainActor
protocol FavouriteRepository {
    func getFavorites() throws -> [FavoriteLocation]
    func saveFavorite(_ location: FavoriteLocation) throws
    func removeFavorite(query: String) throws
    func isFavorite(query: String) throws -> Bool
}
