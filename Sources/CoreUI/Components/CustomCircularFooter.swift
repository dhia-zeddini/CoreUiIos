//
//  SwiftUIView.swift
//  CoreUI
//
//  Created by Sofrecom on 20/2/2025.
//

import SwiftUI

public struct CustomCircularFooter<Content: View>: View {
    let content: () -> Content
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    public var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: ScreenSize.width * 1.5)
                    .offset(y: ScreenSize.height * 0.4)
                    .shadow(radius: 10)
                content()
            }
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
    }
}

