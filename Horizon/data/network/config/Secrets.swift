//
//  Secrets.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//



import Foundation

enum Secrets {
   
    static var apiKey: String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY not found in Info.plist")
        }
        return apiKey
    }
    
    static var baseURL: String {
        guard let host = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("BASE_URL not found in Info.plist")
        }
        return "https://\(host)"
    }
    
 
    static var countryBaseURL: String {
        guard let host = Bundle.main.object(forInfoDictionaryKey: "COUNTRY_BASE_URL") as? String else {
            fatalError("COUNTRY_BASE_URL not found in Info.plist")
        }
        return "https://\(host)"
    }
    
    static var countryApiKey: String {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "COUNTRY_API_KEY") as? String else {
            fatalError("COUNTRY_API_KEY not found in Info.plist")
        }
        return apiKey
    }
}
