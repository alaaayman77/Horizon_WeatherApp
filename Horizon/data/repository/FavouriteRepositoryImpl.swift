//
//  FavouriteRepositoryImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation

@MainActor
final class FavouriteRepositoryImpl: FavouriteRepository {
    private let localDataSource: FavouriteLocalDatasource
    
   
    init(localDataSource: FavouriteLocalDatasource) {
        self.localDataSource = localDataSource
    }
    
    func getFavorites() throws -> [FavoriteLocation] {
      
        let models = try localDataSource.fetchAll()
      
        return models.map(FavoriteLocationMapper.toEntity)
    }
    
    func saveFavorite(_ location: FavoriteLocation) throws {
        
        let model = FavoriteLocationMapper.toData(entity: location)
        
     
        try localDataSource.insert(model)
    }
    
    func removeFavorite(query: String) throws {
        try localDataSource.delete(query: query)
    }
    
    func isFavorite(query: String) throws -> Bool {
        return try localDataSource.checkExists(query: query)
    }
}
