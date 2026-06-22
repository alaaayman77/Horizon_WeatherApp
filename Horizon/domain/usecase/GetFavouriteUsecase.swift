//
//  GetFavouriteUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import Foundation
@MainActor
struct GetFavouriteUsecase {
    let repository: FavouriteRepository
   
    func execute() throws -> [FavoriteLocation] {
        return try repository.getFavorites()
    }
}



