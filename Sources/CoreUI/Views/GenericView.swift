//
//  SwiftUIView.swift
//  CoreUI
//
//  Created by Sofrecom on 18/2/2025.
//

import SwiftUI

public struct GenericView<Content: View>: View {
    let content: () -> Content
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    public var body: some View {
        ZStack {
            CoreUIConfig.shared.primaryColor
            content()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
