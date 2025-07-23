//
//  AnimatedLottieView.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 12/4/2025.
//

import Lottie
import SwiftUI

class ViewForAnimation: UIView {
    var animationName: String = ""
    var bundle: Bundle = Bundle.module
}

public struct AnimatedLottieView: UIViewRepresentable {
    var animationName: String
    var bundle: Bundle

    public init(animationName: String, bundle: Bundle) {
        self.animationName = animationName
        self.bundle = bundle
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        guard let viewForAnimation = uiView as? ViewForAnimation,
              let animationView = viewForAnimation.subviews.first as? LottieAnimationView else {
            return
        }
        
        if viewForAnimation.animationName != animationName {
            animationView.stop()
            
            // Create new animation with updated name
            let newAnimation = LottieAnimation.named(
                animationName,
                bundle: bundle,
                subdirectory: nil,
                animationCache: nil
            )
            
            animationView.animation = newAnimation
            animationView.play()
            
            viewForAnimation.animationName = animationName
        }
    }

    public func makeUIView(context: Context) -> UIView {
        let viewForAnimation = ViewForAnimation()
        viewForAnimation.animationName = animationName
        viewForAnimation.bundle = bundle

        // Create animation using Lottie 4.3.3 syntax
        let animation = LottieAnimation.named(
            animationName,
            bundle: bundle,
            subdirectory: nil,
            animationCache: nil
        )
        
        let animationView = LottieAnimationView()
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        viewForAnimation.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: viewForAnimation.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: viewForAnimation.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: viewForAnimation.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: viewForAnimation.centerYAnchor)
        ])
        
        return viewForAnimation
    }
}
