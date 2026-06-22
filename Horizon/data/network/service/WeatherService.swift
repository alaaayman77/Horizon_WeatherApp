//
//  ForecastService.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import Foundation

class WeatherService {
    private let network: NetworkService
    
    init(network: NetworkService = NetworkManager()) {
        self.network = network
    }
    
    func fetchForecast(query: String, days: Int) async throws -> WeatherResponseDTO {
        let endpoint = WeatherEndpoint.forecast(query: query, days: days)
        return try await network.fetchData(url: endpoint.fullURL, parameters: endpoint.parameters, headers: [:])
    }
    
    func fetchCurrentWeather(query: String) async throws -> WeatherResponseDTO {
        let endpoint = WeatherEndpoint.current(query: query)
        return try await network.fetchData(url: endpoint.fullURL, parameters: endpoint.parameters, headers: [:])
    }
    
 
}
