//
//  SunTimesView.swift
//  Horizon
//
//  Created by Alaa Ayman on 21/06/2026.
//
import SwiftUI
struct SunTimesView: View {
    let sunrise: String
    let sunset: String
    let progress: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("SUN TIMES")
                .font(AppFont.h3)
                .foregroundColor(.textPrimary)

            GeometryReader { geo in
                let width = geo.size.width
                let height: CGFloat = 90
                ZStack {
                    ArcShape()
                        .stroke(Color.textTertiary.opacity(0.5), style: StrokeStyle(lineWidth: 1.5, dash: [4, 5]))
                        .frame(height: height)
                    SunDot(progress: progress)
                        .frame(height: height)
                }
                .frame(width: width, height: height)
            }
            .frame(height: 90)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.sunYellow)
                            .font(.system(size: 13))
                        Text("Sunrise")
                            .font(AppFont.weatherStatLabel)
                            .foregroundColor(.textSecondary)
                    }
                    Text(sunrise)
                        .font(AppFont.weatherRowText)
                        .foregroundColor(.textPrimary)
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 4) {
                    HStack(spacing: 4) {
                        Text("Sunset")
                            .font(AppFont.weatherStatLabel)
                            .foregroundColor(.textSecondary)
                        Image(systemName: "moon.stars.fill")
                            .foregroundColor(.moonPurple)
                            .font(.system(size: 13))
                    }
                    Text(sunset)
                        .font(AppFont.weatherRowText)
                        .foregroundColor(.textPrimary)
                }
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
private struct ArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let start = CGPoint(x: rect.minX, y: rect.maxY)
        let end = CGPoint(x: rect.maxX, y: rect.maxY)
        let control = CGPoint(x: rect.midX, y: rect.minY - rect.height * 0.3)
        path.move(to: start)
        path.addQuadCurve(to: end, control: control)
        return path
    }
}

private struct SunDot: Shape {
    var progress: Double

    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.minX, y: rect.maxY)
        let end = CGPoint(x: rect.maxX, y: rect.maxY)
        let control = CGPoint(x: rect.midX, y: rect.minY - rect.height * 0.3)
        let t = progress
        let x = pow(1 - t, 2) * start.x + 2 * (1 - t) * t * control.x + pow(t, 2) * end.x
        let y = pow(1 - t, 2) * start.y + 2 * (1 - t) * t * control.y + pow(t, 2) * end.y
        var path = Path()
        path.addEllipse(in: CGRect(x: x - 6, y: y - 6, width: 12, height: 12))
        return path
    }
}

extension SunDot: View {
    var body: some View {
        self.fill(Color.uvModerate)
    }
}

