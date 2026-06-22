//
//  LocationRowView.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//


import SwiftUI

struct LocationRowView: View {
    let icon: String
    let title: String
    let subtitle: String
    
 
    @State private var isFavorite: Bool = false

    var body: some View {
        HStack(spacing: 14) {
            Text(icon)
                .font(.system(size: 28))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(AppFont.weatherRowText)
                    .foregroundColor(.textOnPhoto)
                Text(subtitle)
                    .font(AppFont.caption)
                    .foregroundColor(.textOnPhotoSecondary)
            }

            Spacer()
            
   
            Button(action: {
                
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 24))
                    .foregroundColor(isFavorite ? .red : .textOnPhotoSecondary)
                    .padding(.trailing, 4)
            }
            .buttonStyle(.plain)
        
            Image(systemName: "chevron.right")
                .font(.system(size: 12))
                .foregroundColor(.white)
        }
        .padding(.vertical, 14)
        .contentShape(Rectangle())
    }
}
