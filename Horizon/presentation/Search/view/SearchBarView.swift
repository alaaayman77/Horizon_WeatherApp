//
//  SearchBarView.swift
//  Horizon
//
//  Created by Alaa Ayman on 22/06/2026.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var query: String
    let onClear: () -> Void

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.deepNavy)
                .font(.system(size: 16))

            TextField("Search city...", text: $query)
                .font(AppFont.body)
                .foregroundColor(.textOnPhoto)
                .tint(.white)

            if !query.isEmpty {
                Button(action: onClear) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.textOnPhotoSecondary)
                        .font(.system(size: 16))
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.cardFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Color.deepNavy, lineWidth: 1)
                )
        )
    }
}

