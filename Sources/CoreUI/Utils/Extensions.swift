//
//  Extensions.swift
//  CoreUI
//
//  Created by Sofrecom on 25/2/2025.
//



import SwiftUI

/// A shape that rounds only the specified corners with a given radius.
public struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    /// Clips this view to its bounding frame with the specified corner radius on chosen corners.
    public  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    /// Adds an error alert to the view.
    ///
    /// - Parameter errorState: The state of the error alert.
    /// - Returns: The modified view with the error alert.
    public func errorAlert(errorState: ErrorState) -> some View {
        alert("Error", isPresented: .constant(errorState.isPresented)) {
            Button("OK") {}
        } message: {
            Text(errorState.message)
        }
    }
    
    /// Adds a loading overlay to the view.
    ///
    /// - Parameter isLoading: Whether the view is currently loading.
    /// - Returns: The modified view with the loading overlay.
    public func loadingOverlay(isLoading: Bool) -> some View {
        overlay {
            if isLoading {
                Skeleton()
            }
        }
    }
    
    /// Adds a Shimmer Effect to the View
    public func shimmer(duration: Double = 1.2) -> some View {
        self
            .modifier(ShimmerEffect(duration: duration))
    }
}



extension String {
    public subscript(_ idx: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: idx)]
    }
}


