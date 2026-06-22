//
//  CountryRemoteDatasourceImpl.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

class CountriesRemoteDataSourceImpl: CountriesRemoteDataSource {
    private let countriesService: CountriesService

    init(countriesService: CountriesService = CountriesService()) {
        self.countriesService = countriesService
    }

    func getAllCountries() async throws -> [CountryDTO] {
        let response = try await countriesService.fetchAllCountries()
        return response.data.objects
    }
}
