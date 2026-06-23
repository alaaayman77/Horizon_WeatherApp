//
//  WeatherCacheDAO.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//


import Foundation

import Foundation

protocol WeatherCacheDAO {
    func save(query: String, data: Data) throws
    func load(query: String) throws -> Data?
}
