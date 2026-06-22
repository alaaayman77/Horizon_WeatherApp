//
//  SavFavouriteUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation
@MainActor
struct SaveFavouriteUsecase {
    let repository: FavouriteRepository
    
    func execute(location: FavoriteLocation) throws {
        try repository.saveFavorite(location)
    }
}
