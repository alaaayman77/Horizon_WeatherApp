//
//  CountryDTO.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

struct CountriesResponseDTO: Decodable {
    let data: CountriesDataDTO
}

struct CountriesDataDTO: Decodable {
    let objects: [CountryDTO]
}

struct CountryDTO: Decodable {
    let names: NamesDTO
    let codes: CodesDTO
    let flag: FlagDTO

    struct NamesDTO: Decodable {
        let common: String
    }

    struct CodesDTO: Decodable {
        let alpha2: String

        enum CodingKeys: String, CodingKey {
            case alpha2 = "alpha_2"
        }
    }

    struct FlagDTO: Decodable {
        let emoji: String
    }
}

