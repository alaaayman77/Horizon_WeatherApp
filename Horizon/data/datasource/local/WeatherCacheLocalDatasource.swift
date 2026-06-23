//
//  WeatherCacheLocalDatasource.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//




import Foundation
@MainActor
protocol WeatherCacheLocalDatasource {
    func saveCache(query: String, dto: WeatherResponseDTO) throws
    func loadCache(query: String) throws -> WeatherResponseDTO?
}
