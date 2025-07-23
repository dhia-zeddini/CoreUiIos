//
//  UnderDevelopmnetView.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 10/4/2025.
//

import SwiftUI

public struct UnderDevelopmnetView: View {
    let title: String
    let animation: String

    public init(title: String = "Encours de Développement", animation: String) {
        self.title = title
        self.animation = animation
    }
    public var body: some View {
        VStack {
            BackButton()
            Text(title)
                .font(.title)
                .bold()
                .foregroundColor(.primaryColor)
                .padding(.top,paddingXL)
            AnimatedLottieView(animationName: animation, bundle: .main)
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}
