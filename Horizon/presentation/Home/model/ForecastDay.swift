//
//  ForecastDay.swift
//  Horizon
//
//  Created by Alaa Ayman on 18/06/2026.
//
import SwiftUI

struct ForecastDay: Identifiable {
   let id = UUID()
   let name: String
   let icon: String
   let high: Int
   let low: Int
}
