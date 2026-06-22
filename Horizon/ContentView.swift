//
//  ContentView.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @State private var selection : TabKey = .home
    
    var body: some View {
      
        ZStack(alignment: .bottom) {
      
            TabView(selection: $selection){
                Tab( value: TabKey.home){
                    HomeView().toolbar(.hidden, for: .tabBar)
                }
                Tab( value: TabKey.favourite){
                    FavouriteView().toolbar(.hidden, for: .tabBar)
                }
                Tab(value: TabKey.search, role : .search){
                    SearchView().toolbar(.hidden, for: .tabBar)
                }
            }
         
        
            HStack(spacing: 40) {
                TabBarButton(icon: "cloud.bolt.rain.fill", title: "Home", tab: .home, selection: $selection)
                TabBarButton(icon: "heart.fill", title: "Favourite", tab: .favourite, selection: $selection)
                TabBarButton(icon: "magnifyingglass", title: "Search", tab: .search, selection: $selection)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.cardFill)
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
            .padding(.bottom, 10)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}


 

