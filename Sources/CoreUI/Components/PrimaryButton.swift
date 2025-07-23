//
//  PrimaryButton.swift
//  CoreUI
//
//  Created by Sofrecom on 19/2/2025.
//
import SwiftUI

public struct PrimaryButton: View {
    let label: String
    let maxWidth: CGFloat
    let action: () -> Void
    let bgColor: Color
    let fgColor: Color
    let shadow : CGFloat
    public init(label: String, maxWidth: CGFloat = .infinity, action: @escaping () -> Void, bgColor: Color = CoreUIConfig.shared.buttonColor, fgColor: Color = .white, shadow: CGFloat = 3) {
        self.label = label
        self.maxWidth = maxWidth
        self.action = action
        self.bgColor = bgColor
        self.fgColor = fgColor
        self.shadow = shadow
    }
    public var body: some View {
        Button(action:
            action
        ) {
            Text(label)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: maxWidth)
                .padding(.vertical, 8)
        }
        .buttonStyle(.borderedProminent)
        .tint(bgColor)
        .foregroundColor(fgColor)
        .shadow(radius: shadow)
    }
}
