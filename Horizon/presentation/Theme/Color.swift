//
//  Color.swift
//  Horizon
//
//  Created by Alaa Ayman on 15/06/2026.
//
import SwiftUI

extension Color {
   
    static let navy = Color(red: 0.08, green: 0.20, blue: 0.42)
 
   
    static let accentBlue = Color(red: 0.35, green: 0.58, blue: 0.92)
 
    
    static let deepNavy = Color(red: 0.04, green: 0.10, blue: 0.24)
 
    
    static let cardFill   = Color.navy.opacity(0.45)
    static let cardStroke = Color.accentBlue.opacity(0.15)
 
   
    static let textPrimary   = Color.white
    static let textSecondary = Color.white.opacity(0.72)
    static let textTertiary  = Color.white.opacity(0.5)
}
