//
//  NoInternetBannerView.swift
//  Horizon
//
//  Created by Alaa Ayman on 23/06/2026.
//


import SwiftUI

struct NoInternetBannerView: View {
    let onRetry: () -> Void

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "wifi.slash")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)

            Text("No internet — showing cached data")
                .font(AppFont.caption)
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.8)

            Spacer()

            Button(action: onRetry) {
                Text("Retry")
                    .font(AppFont.body)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.white.opacity(0.25))
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.orange.opacity(0.85))
    }
}
