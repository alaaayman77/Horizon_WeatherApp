//
//  CountryRepository.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

protocol CountriesRepository {
    func getAllCountries() async throws -> [Country]
}
