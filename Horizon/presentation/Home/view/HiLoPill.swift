//
//  HiLoPill.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import SwiftUI

struct HiLoPill: View {
    let icon: String
    let value: String
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
                .font(.system(size: 9, weight: .bold))
            Text(value)
                .font(AppFont.weatherStatLabel)
        }
        .foregroundColor(.textPrimary)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Capsule().fill(Color.pillFill))
    }
    }



