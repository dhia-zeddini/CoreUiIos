//
//  Effects.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 10/4/2025.
//

import SwiftUI

struct ShimmerEffect: ViewModifier {
    var duration: Double

    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    .clear,
                                    Color.white.opacity(0.6),
                                    .clear
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .rotationEffect(.degrees(70))
                        .offset(x: isAnimating ? geometry.size.width : -geometry.size.width)
                        .animation(
                            Animation.linear(duration: duration).repeatForever(autoreverses: false),
                            value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                }
                .clipped()
            )
    }
}
