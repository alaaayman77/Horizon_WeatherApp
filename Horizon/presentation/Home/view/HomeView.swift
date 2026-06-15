//
//  HomeView.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Image("")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
               HomeHeaderView()
                Spacer()
            }
           
        }
    }
}


#Preview{
    HomeView().preferredColorScheme(.dark)
}
