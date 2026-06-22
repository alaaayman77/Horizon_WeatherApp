//
//  CountryItem.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

struct CountryItem: Identifiable, Equatable {
    var id: String { query }
    let name: String
    let code: String
    let flagEmoji: String
    let query: String
    
 
    var isFavorite: Bool
}
