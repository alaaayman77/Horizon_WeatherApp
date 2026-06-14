//
//  Item.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
