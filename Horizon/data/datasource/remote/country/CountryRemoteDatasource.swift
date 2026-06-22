//
//  CountryRemoteDatasource.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

protocol CountriesRemoteDataSource {
    func getAllCountries() async throws -> [CountryDTO]
}
