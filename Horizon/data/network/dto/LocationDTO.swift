//
//  LocationDTO.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//

struct LocationDTO: Decodable {
    let name: String
    let region: String  
    let country: String
    let lat: Double
    let lon: Double
    let tzId: String
    let localtimeEpoch: Int
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
    }
}
