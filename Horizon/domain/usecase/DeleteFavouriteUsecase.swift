//
//  DeleteFavouriteUsecase.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation
@MainActor
struct DeleteFavouriteUsecase {
    let repository: FavouriteRepository
    
   
    
    func execute(query: String) throws {
        try repository.removeFavorite(query: query)
    }
}
