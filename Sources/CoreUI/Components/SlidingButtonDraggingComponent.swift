//
//  SlidingButtonDraggingComponent.swift
//  CoreUI
//
//  Created by Sofrecom on 7/3/2025.
//


import SwiftUI

struct SlidingButtonDraggingComponent: View {

    let maxWidth: CGFloat
    @Binding var isLocked: Bool
    let action: () -> Void
    
    private let minWidth = CGFloat(50)
    @State private var width = CGFloat(50)

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .opacity(width / maxWidth)
            .frame(width: width)
            .overlay(
                ZStack {
                    image(name: "chevron.right")
                },
                alignment: .trailing
            )
            .gesture(
                DragGesture()
                    .onChanged { value in
                        guard isLocked else { return }
                        if value.translation.width > 0 {
                            width = min(
                                max(
                                    value.translation.width + minWidth, minWidth
                                ), maxWidth)
                        }
                    }
                    .onEnded { value in
                        guard isLocked else { return }
                        if width < maxWidth {
                            width = minWidth
                            UINotificationFeedbackGenerator()
                                .notificationOccurred(.warning)
                        } else {
                            UINotificationFeedbackGenerator()
                                .notificationOccurred(.success)
                            withAnimation(.spring().delay(0.5)) {
                                isLocked = false
                                action()
                            }
                        }
                    }
            )
            .animation(
                .spring(response: 0.5, dampingFraction: 1, blendDuration: 0),
                value: width)
    }

    private func image(name: String) -> some View {
        Image(systemName: name)
            .font(.system(size: 20, weight: .regular, design: .rounded))
            .frame(width: 47, height: 47)
            .background(Circle().fill(.white))
            .padding(3)
            .shadow(radius: 3)
    }
}
