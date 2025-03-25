//
//  CircularIcon.swift
//  CoreUI
//
//  Created by Sofrecom on 19/2/2025.
//


import SwiftUI

public struct CircularIcon: View {
    let icon : String
    let maxWidth : CGFloat
    let maxHeight : CGFloat
    public init(icon: String, maxWidth: CGFloat, maxHeight: CGFloat) {
        self.icon = icon
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }
    public var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(maxHeight: maxHeight)
                .shadow(radius: 4)
            Image(systemName: icon)
                .foregroundColor(.primaryColor)
                .font(.system(size: 25))
        }
        .overlay(Circle().stroke(Color.primaryColor, lineWidth: 2))
    }
}
