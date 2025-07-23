//
//  CustomCornoredBackground.swift
//  CoreUI
//
//  Created by Sofrecom on 25/2/2025.
//

import SwiftUI

public struct CustomCornoredBackground: View {
    let color: Color
    let radius:CGFloat
    let corners:UIRectCorner
    let shadow:CGFloat
    public init(color: Color = Color.primaryColor, radius: CGFloat, corners: UIRectCorner,shadow:CGFloat = 0) {
        self.color = color
        self.radius = radius
        self.corners = corners
        self.shadow = shadow
    }
    public var body: some View {
        color
            .cornerRadius(radius, corners: corners)
            .shadow(radius: shadow)
            .ignoresSafeArea()
    }
}

