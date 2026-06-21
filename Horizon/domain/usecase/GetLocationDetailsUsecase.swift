//
//  GetLocationDetailsUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//


import Foundation
struct GetLocationUsecase {
    private let repository: WeatherRepository

    init(repository: WeatherRepository = WeatherRepositoryImpl()) {
        self.repository = repository
    }

    func execute(query: String) async throws -> Location {
        return try await repository.getLocation(query: query)
    }
}
