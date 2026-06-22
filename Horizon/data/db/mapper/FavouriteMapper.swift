//
//  FavouriteMapper.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import Foundation

enum FavoriteLocationMapper {
    
   
    static func toEntity(model: FavoriteLocationModel) -> FavoriteLocation {
        return FavoriteLocation(
            query: model.query,
            name: model.name,
            code: model.code,
            flagEmoji: model.flagEmoji,
            createdAt: model.createdAt
        )
    }
    
  
    static func toData(entity: FavoriteLocation) -> FavoriteLocationModel {
        return FavoriteLocationModel(
            name: entity.name,
            code: entity.code,
            flagEmoji: entity.flagEmoji,
            query: entity.query,
            createdAt: entity.createdAt
        )
    }
}
