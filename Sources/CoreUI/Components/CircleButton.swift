//
//  SwiftUIView.swift
//  CoreUI
//
//  Created by Sofrecom on 20/2/2025.
//

import SwiftUI

public struct CircleButton: View {
    let icon: String
    let isSystemImage: Bool
    let action: () -> Void
    let color: Color
    let forgorundColor: Color
    let strokeColor: Color
    let size: CGFloat
    let shadow: CGFloat
    let font: Font
    public init(
        icon: String, isSystemImage: Bool = false, action: @escaping () -> Void,
        color: Color = .primaryColor, forgorundColor: Color = .white,
        strokeColor: Color = Color.primaryColor, size: CGFloat = 50,
        shadow: CGFloat = 0, font: Font
    ) {
        self.icon = icon
        self.isSystemImage = isSystemImage
        self.action = action
        self.color = color
        self.forgorundColor = forgorundColor
        self.strokeColor = strokeColor
        self.size = size
        self.shadow = shadow
        self.font = font
    }
    public var body: some View {
        Button(
            action: action,
            label: {
                if isSystemImage {
                    Image(systemName: icon)
                } else {
                    Text(icon)
                        .fontWeight(.bold)
                }
            }
        ).foregroundColor(forgorundColor)
            .font(font)
            .frame(width: size, height: size)
            .background(Circle().fill(color))
            .shadow(radius: shadow)
            .overlay(Circle().stroke(strokeColor, lineWidth: 1))

    }
}
