//
//  OnboradingPage.swift
//  CoreUI
//
//  Created by Sofrecom on 19/2/2025.
//


import SwiftUI

public struct OnboradingModel: Identifiable {
    public let id = UUID()
    public let label: String
    public let text: String
    public let image: String
    
    public init(label: String, text: String, image: String) {
        self.label = label
        self.text = text
        self.image = image
    }
}

