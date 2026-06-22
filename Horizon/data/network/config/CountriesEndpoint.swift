//
//  CountriesEndpoint.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation

enum CountriesEndpoint {
    case all

    var fullURL: String {
        switch self {
        case .all:
            return Secrets.countryBaseURL
        }
    }

    var parameters: [String: Any] {
        switch self {
        case .all:
            return [
                "response_fields": "names.common,codes.alpha_2,flag.emoji",
                "limit": 100
            ]
        }
    }

    var headers: [String: String] {
        return ["Authorization": "Bearer \(Secrets.countryApiKey)"]
    }
}
