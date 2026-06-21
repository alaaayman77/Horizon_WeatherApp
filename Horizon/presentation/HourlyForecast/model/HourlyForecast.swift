//
//  HourlyForecast.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import SwiftUI
struct HourlyForecast: Identifiable {
    let id = UUID()
    let time: String
    let icon: String
    let temperature: Int
    let isNow: Bool
}

