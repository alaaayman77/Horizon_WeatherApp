//
//  CountryRepoistoryImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

class CountriesRepositoryImpl: CountriesRepository {
    private let remoteDataSource: CountriesRemoteDataSource

    init(remoteDataSource: CountriesRemoteDataSource = CountriesRemoteDataSourceImpl()) {
        self.remoteDataSource = remoteDataSource
    }

    func getAllCountries() async throws -> [Country] {
        let dtos = try await remoteDataSource.getAllCountries()
        return dtos
            .map { $0.toEntity() }
            .sorted { $0.name < $1.name }
    }
}
