//
//  ForecastDTO.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

struct ForecastDTO: Decodable {
    let forecastday: [ForecastDayDTO]
}

struct ForecastDayDTO: Decodable {
    let dateEpoch: Int
    let day: DayDTO
    let astro: AstroDTO
    let hour: [HourlyWeatherDTO]
    
    enum CodingKeys: String, CodingKey {
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

struct DayDTO: Decodable {
    let maxtempC: Double
    let mintempC: Double
    let condition: ConditionDTO
    let dailyChanceOfRain: Int
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
        case dailyChanceOfRain = "daily_chance_of_rain"
    }
}


struct AstroDTO: Decodable {
    let sunrise: String
    let sunset: String
}
struct HourlyWeatherDTO: Decodable {
    let timeEpoch: Int
    let tempC: Double
    let condition: ConditionDTO
    let chanceOfRain: Int
    
    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case tempC = "temp_c"
        case condition
        case chanceOfRain = "chance_of_rain"
    }
}
