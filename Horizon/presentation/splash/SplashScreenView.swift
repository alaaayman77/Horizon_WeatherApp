//
//  SplashScreenView.swift
//  Horizon
//
//  Created by Alaa Ayman on 24/06/2026.
//


import SwiftUI

struct SplashScreenView: View {
    @State private var opacity: Double = 0
    @State private var scale: Double = 0.85
    @State private var taglineOpacity: Double = 0
    @State private var taglineOffset: Double = 10
    @State private var circleScale: Double = 0
    @State private var circleOpacity: Double = 0
    @State private var shimmerOffset: CGFloat = -200

    let onFinished: () -> Void

    var body: some View {
        ZStack {
        
            Image("splash")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.deepNavy.opacity(0.55)
                .ignoresSafeArea()

            Circle()
                .stroke(Color.white.opacity(0.06), lineWidth: 1)
                .frame(width: 320, height: 320)
                .scaleEffect(circleScale)
                .opacity(circleOpacity)

            Circle()
                .stroke(Color.white.opacity(0.04), lineWidth: 1)
                .frame(width: 220, height: 220)
                .scaleEffect(circleScale)
                .opacity(circleOpacity)

        
            VStack(spacing: 10) {
         
                Image(systemName: "sun.horizon.fill")
                    .font(.system(size: 44, weight: .thin))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color.orange.opacity(0.9), Color.yellow.opacity(0.6)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .opacity(opacity)
                    .scaleEffect(scale)

             
                ZStack {
                    Text("Horizon")
                        .font(AppFont.largeHeader)
                        .foregroundColor(.textOnPhoto)

                
                    Text("Horizon")
                        .font(AppFont.largeHeader)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color.clear,
                                    Color.white.opacity(0.6),
                                    Color.clear
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .mask(
                            Rectangle()
                                .frame(width: 80)
                                .offset(x: shimmerOffset)
                        )
                }
                .opacity(opacity)
                .scaleEffect(scale)

                Text("Your weather, beautifully clear")
                    .font(AppFont.caption)
                    .foregroundColor(.textOnPhotoSecondary)
                    .tracking(0.5)
                    .opacity(taglineOpacity)
                    .offset(y: taglineOffset)
            }
        }
        .onAppear {
            // Rings expand
            withAnimation(.easeOut(duration: 1.0)) {
                circleScale = 1
                circleOpacity = 1
            }

            withAnimation(.easeOut(duration: 0.8)) {
                opacity = 1
                scale = 1
            }

            withAnimation(.easeOut(duration: 0.6).delay(0.5)) {
                taglineOpacity = 1
                taglineOffset = 0
            }
            withAnimation(.easeInOut(duration: 0.9).delay(1.0)) {
                shimmerOffset = 300
            }

         
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.2) {
                withAnimation(.easeIn(duration: 0.5)) {
                    opacity = 0
                    taglineOpacity = 0
                    circleOpacity = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    onFinished()
                }
            }
        }
    }
}
