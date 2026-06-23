//
//  WeatherCacheDAOImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//


import Foundation
import SwiftData

@MainActor
final class WeatherCacheDAOImpl: WeatherCacheDAO {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func save(query: String, data: Data) throws {
        let predicate = #Predicate<WeatherCacheEntity> { $0.query == query }
        var descriptor = FetchDescriptor<WeatherCacheEntity>(predicate: predicate)
        descriptor.fetchLimit = 1

        if let existing = try context.fetch(descriptor).first {
            existing.weatherJSON = data
            existing.cachedAt = .now
        } else {
            context.insert(WeatherCacheEntity(query: query, weatherJSON: data))
        }
        try context.save()
    }

    func load(query: String) throws -> Data? {
        let predicate = #Predicate<WeatherCacheEntity> { $0.query == query }
        var descriptor = FetchDescriptor<WeatherCacheEntity>(predicate: predicate)
        descriptor.fetchLimit = 1
        return try context.fetch(descriptor).first?.weatherJSON
    }
}
