//
//  UVIndex.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//

import SwiftUI

struct UVIndexView: View {
    let value: Int = 2
    let label: String = "Moderate"
    let percent: Double = 0.23

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("UV INDEX")
                .font(AppFont.h3)
                .foregroundColor(.textPrimary)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(value)")
                        .font(AppFont.h1)
                        .foregroundColor(.textPrimary)

                    Text(label)
                        .font(AppFont.weatherRowText)
                        .foregroundColor(.uvModerate)
                }

                Spacer()

                ZStack {
                    Circle()
                        .stroke(Color.textTertiary.opacity(0.25), lineWidth: 7)

                    Circle()
                        .trim(from: 0, to: percent)
                        .stroke(Color.uvModerate, style: StrokeStyle(lineWidth: 7, lineCap: .round))
                        .rotationEffect(.degrees(-90))

                    Text("\(Int(percent * 100))%")
                        .font(AppFont.weatherStatLabel)
                        .foregroundColor(.textPrimary)
                }
                .frame(width: 64, height: 64)
            }
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color.cardFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(Color.cardStroke, lineWidth: 1)
                )
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    ZStack {
        Color.white.ignoresSafeArea()
        UVIndexView()
    }
}
