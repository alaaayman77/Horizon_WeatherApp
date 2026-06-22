//
//  CheckFavouriteUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation
@MainActor
struct CheckFavouriteUsecase {
    let repository: FavouriteRepository
    
    func execute(query: String) throws -> Bool {
        return try repository.isFavorite(query: query)
    }
}
