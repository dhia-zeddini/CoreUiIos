//
//  SlidingButton.swift
//  CoreUI
//
//  Created by Sofrecom on 7/3/2025.
//

import SwiftUI

public struct SlidingButton: View {
    @Binding var  isLocked : Bool
    let action: () -> Void
    public init(isLocked: Binding<Bool>, action: @escaping () -> Void) {
        self._isLocked = isLocked
        self.action = action
    }
    public  var body: some View {
            ZStack(alignment: .leading) {
                SlidingButtonBackgroundComponent()
                SlidingButtonDraggingComponent(
                    maxWidth: ScreenSize.width * 0.7, isLocked: $isLocked,action: action)
        }
            .frame(width:ScreenSize.width * 0.7,height: 50)
        .padding()
    }
}




