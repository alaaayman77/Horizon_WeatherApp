//
//  WeatherResponseDTO.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

struct WeatherResponseDTO: Codable {
    let location: LocationDTO
    let current: CurrentWeatherDTO
    let forecast: ForecastDTO
}
