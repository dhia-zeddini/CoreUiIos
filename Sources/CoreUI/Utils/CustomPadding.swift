//
//  CustomPadding.swift
//  CoreUI
//
//  Created by Sofrecom on 18/2/2025.
//

import SwiftUI
import Foundation

public let horizontalPadding: CGFloat = 16.0
public let listItemMinHeight: CGFloat = 56.0

public let paddingXXS: CGFloat = 4.0
public let paddingXS: CGFloat = 8.0
public let paddingS: CGFloat = 12.0
public let paddingM: CGFloat = 16.0
public let paddingL: CGFloat = 20.0
public let paddingXL: CGFloat = 24.0
public let paddingXXL: CGFloat = 32.0
public let paddingXXXL: CGFloat = 40.0


// MARK: - Responsive values
@MainActor
public struct ScreenSize {
    public static var width: CGFloat {
        UIScreen.main.bounds.size.width
    }
    public static var width14: CGFloat {
        width
        * 0.25
    }
    
    public static var height: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    public static var height13: CGFloat {
        height
        * 0.33
    }
    public static var height23: CGFloat {
        height
        * 0.66
    }
}
