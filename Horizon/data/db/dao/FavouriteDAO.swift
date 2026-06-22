//
//  FavouriteDAO.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation
@MainActor
protocol FavoritesDAO {
    func fetchAll() throws -> [FavoriteLocationModel]
    func insert(_ model: FavoriteLocationModel) throws
    func delete(query: String) throws
    func checkExists(query: String) throws -> Bool
}
