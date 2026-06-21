//
//  WeatherStat.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import SwiftUI
struct WeatherStat: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let icon: String
    let iconColor: Color
}
