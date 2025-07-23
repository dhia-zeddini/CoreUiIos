//
//  SwiftUIView.swift
//  CoreUI
//
//  Created by Sofrecom on 19/2/2025.
//

import SwiftUI

public struct OnboardingView: View {
    let skipAction: () -> Void

    public init(skipAction: @escaping () -> Void) {
        self.skipAction = skipAction
    }
    public var body: some View {
        GenericView {
            OnboardingContentView(skipAction: skipAction)
        }
    }
}

#Preview {
    OnboardingView(skipAction: {})
}
