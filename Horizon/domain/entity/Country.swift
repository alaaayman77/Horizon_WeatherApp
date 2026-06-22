//
//  Country.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let code: String
    let flagEmoji: String

    var query: String { name }
}
