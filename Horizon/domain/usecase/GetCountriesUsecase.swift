//
//  GetCountriesUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

final class GetCountriesUsecase {
    private let repository: CountriesRepository

    init(repository: CountriesRepository = CountriesRepositoryImpl()) {
        self.repository = repository
    }

    func execute() async throws -> [Country] {
        return try await repository.getAllCountries()
    }
}
