//
//  HorizonApp.swift
//  Horizon
//
//  Created by Alaa Ayman on 14/06/2026.
//


import SwiftUI
import SwiftData

@main
struct HorizonApp: App {

    let container: ModelContainer
    @State private var showSplash = true

    init() {
        do {
            let schema = Schema([
                FavoriteLocationModel.self,
                WeatherCacheEntity.self
            ])
            container = try ModelContainer(for: schema)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView {
                    showSplash = false
                }
            } else {
                ContentView()
            }
        }
        .modelContainer(container)
    }
}
