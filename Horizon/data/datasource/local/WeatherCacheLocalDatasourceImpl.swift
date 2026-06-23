//
//  WeatherCacheLocalDatasourceImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//



import Foundation

@MainActor
final class WeatherCacheLocalDatasourceImpl: WeatherCacheLocalDatasource {
    private let dao: WeatherCacheDAO

    init(dao: WeatherCacheDAO) {
        self.dao = dao
    }

    func saveCache(query: String, dto: WeatherResponseDTO) throws {
        let data = try JSONEncoder().encode(dto)
        try dao.save(query: query, data: data)
    }

    func loadCache(query: String) throws -> WeatherResponseDTO? {
        guard let data = try dao.load(query: query) else { return nil }
        return try JSONDecoder().decode(WeatherResponseDTO.self, from: data)
    }
}
