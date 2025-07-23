//
//  OnboardingContentView.swift
//  CoreUI
//
//  Created by Sofrecom on 19/2/2025.
//

import SwiftUI

struct OnboardingContentView: View {
    let skipAction: () -> Void
    var body: some View {
        VStack {
            TabView {
                ForEach(CoreUIConfig.shared.onBoardingLst) { page in
                    GenericPageWithImage(page: page)
                        .foregroundColor(.white)
                }
            }.tabViewStyle(.page)
            PrimaryButton(
                label: "Skip", maxWidth: .infinity, action: skipAction, bgColor: .white,
                fgColor: .primaryColor, shadow: 3
            )
            .padding(.bottom, paddingXXL)
            .padding(.horizontal, paddingXXL)
        }
    }
}
