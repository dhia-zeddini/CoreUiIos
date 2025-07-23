//
//  ErrorState.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 8/4/2025.
//


import SwiftUI

/// Represents the state of an error alert.
public struct ErrorState {
    /// Whether the alert is presented.
    var isPresented = false
    
    /// The error message to display.
    var message = ""
    
    public init(isPresented: Bool = false, message: String = "") {
        self.isPresented = isPresented
        self.message = message
    }
}