//
//  FavouriteEntity.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation
import SwiftData

@Model
final class FavoriteLocationModel {
    @Attribute(.unique) var query: String
    var name: String
    var code: String
    var flagEmoji: String
    var createdAt: Date

    init(name: String, code: String, flagEmoji: String, query: String, createdAt: Date = Date()) {
        self.name = name
        self.code = code
        self.flagEmoji = flagEmoji
        self.query = query
        self.createdAt = createdAt
    }
}
