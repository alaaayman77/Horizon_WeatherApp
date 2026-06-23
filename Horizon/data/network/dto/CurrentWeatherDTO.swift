//
//  CurrentWeatherDTO.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
struct CurrentWeatherDTO: Codable {
    let tempC: Double
    let isDay: Int
    let condition: ConditionDTO
    let pressureMb: Double
    let humidity: Int
    let feelslikeC: Double
    let visKm: Double
    let uv: Double
    let windKph: Double
    let cloud: Int
    let airQuality: AirQualityDTO?
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case pressureMb = "pressure_mb"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKm = "vis_km"
        case uv
        case windKph = "wind_kph"
        case cloud
        case airQuality = "air_quality"
    }
}

struct ConditionDTO: Codable {
    let text: String
    let icon: String
}

struct AirQualityDTO: Codable {
    let usEpaIndex: Int
    
    enum CodingKeys: String, CodingKey {
        case usEpaIndex = "us-epa-index"
    }
}
