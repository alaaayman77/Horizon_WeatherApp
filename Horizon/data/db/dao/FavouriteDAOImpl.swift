//
//  FavouriteDAOImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation
import SwiftData

@MainActor
final class FavoritesDAOImpl: FavoritesDAO {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func fetchAll() throws -> [FavoriteLocationModel] {
        let descriptor = FetchDescriptor<FavoriteLocationModel>(
            sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
        )
        return try context.fetch(descriptor)
    }
    
    func insert(_ model: FavoriteLocationModel) throws {
        context.insert(model)
        try context.save()
    }
    
    func delete(query: String) throws {
        let predicate = #Predicate<FavoriteLocationModel> { $0.query == query }
        try context.delete(model: FavoriteLocationModel.self, where: predicate)
        try context.save()
    }
    
    func checkExists(query: String) throws -> Bool {
        let predicate = #Predicate<FavoriteLocationModel> { $0.query == query }
        var descriptor = FetchDescriptor<FavoriteLocationModel>(predicate: predicate)
        descriptor.fetchLimit = 1
        
        return try context.fetchCount(descriptor) > 0
    }
}
