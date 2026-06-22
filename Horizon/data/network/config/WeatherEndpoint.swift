//
//  ApiEndpoint.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//


import Foundation

enum WeatherEndpoint {
    case forecast(query: String, days: Int)
    case search(query: String)
    case current(query: String)
    
    private var path: String {
        switch self {
        case .forecast: return "forecast.json"
        case .search: return "search.json"
        case .current: return "current.json"
        }
    }

    var fullURL: String {
        return "\(Secrets.baseURL)/\(path)"
    }
    
    var parameters: [String: Any] {
        var params: [String: Any] = [
            "key": Secrets.apiKey
        ]
        
        switch self {
        case .forecast(let query, let days):
            params["q"] = query
            params["days"] = days
            params["aqi"] = "yes"
            params["alerts"] = "no"
            
        case .search(let query):
            params["q"] = query
            
        case .current(let query):
            params["q"] = query
            params["aqi"] = "yes"
        }
        
        return params
    }
}


