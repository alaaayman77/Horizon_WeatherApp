//
//  FavouriteLocalDatasourceImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation
@MainActor
final class FavouriteLocalDatasourceImpl: FavouriteLocalDatasource {
    private let dao: FavoritesDAO
    
   
    init(dao: FavoritesDAO) {
        self.dao = dao
    }
    
    func fetchAll() throws -> [FavoriteLocationModel] {
        
        return try dao.fetchAll()
    }
    
    func insert(_ model: FavoriteLocationModel) throws {
        try dao.insert(model)
    }
    
    func delete(query: String) throws {
        try dao.delete(query: query)
    }
    
    func checkExists(query: String) throws -> Bool {
        return try dao.checkExists(query: query)
    }
}
