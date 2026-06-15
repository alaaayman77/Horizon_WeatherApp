//
//  HomeHeader.swift
//  Horizon
//
//  Created by Alaa Ayman on 15/06/2026.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
     
        VStack(spacing : 8){
                Text("London")
                .font(AppFont.h1)
                    .foregroundColor(.textPrimary)
              
                Text("16°C")
                .font(AppFont.largeHeader)
                    .foregroundColor(.textPrimary)
                
                Text("Cloudy")
                    .font(AppFont.h2)
                    .foregroundColor(.textPrimary)
                
                Text("H: 6°  L: 12°")
                    .font(AppFont.body)
                    .foregroundColor(.textSecondary)
            }
        }
}


