//
//  CoreUIConfig.swift
//  CoreUI
//
//  Created by Sofrecom on 24/2/2025.
//

import Foundation
import SwiftUI

@MainActor
public class CoreUIConfig : ObservableObject {
    @Published public var primaryColor: Color
    public var buttonColor: Color
    public var textFieldColor: Color
    public let onBoardingLst: [OnboradingModel]
    
    public static var shared = CoreUIConfig()
    
    public init(
        primaryColor: Color = Color(hex:"#A83332"),
        buttonColor: Color? = nil,
        textFieldColor: Color? = nil,
        onboardingList: [OnboradingModel] = []
    ) {
        self.primaryColor = primaryColor
        self.buttonColor = buttonColor ?? primaryColor
        self.textFieldColor = textFieldColor ?? primaryColor
        self.onBoardingLst = onboardingList
    }
    
}

