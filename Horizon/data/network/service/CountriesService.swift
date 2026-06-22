//
//  CountriesService.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation
import Alamofire

class CountriesService {
    private let network: NetworkService

    init(network: NetworkService = NetworkManager()) {
        self.network = network
    }

    func fetchAllCountries() async throws -> CountriesResponseDTO {
        let endpoint = CountriesEndpoint.all
        return try await network.fetchData(
            url: endpoint.fullURL,
            parameters: endpoint.parameters,
            headers: endpoint.headers
        )
    }
}
