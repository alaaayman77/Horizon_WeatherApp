//
//  CountryMapper.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

extension CountryDTO {
    func toEntity() -> Country {
        return Country(
            name: names.common,
            code: codes.alpha2,
            flagEmoji: flag.emoji
        )
    }
}


