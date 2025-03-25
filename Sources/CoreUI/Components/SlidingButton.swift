//
//  SlidingButton.swift
//  CoreUI
//
//  Created by Sofrecom on 7/3/2025.
//

import SwiftUI

public struct SlidingButton: View {
    @Binding var  isLocked : Bool
    public init(isLocked: Binding<Bool>) {
        self._isLocked = isLocked
    }
    public  var body: some View {
            ZStack(alignment: .leading) {
                SlidingButtonBackgroundComponent()
                SlidingButtonDraggingComponent(
                    maxWidth: ScreenSize.width * 0.7, isLocked: $isLocked)
        }
            .frame(width:ScreenSize.width * 0.7,height: 50)
        .padding()
    }
}




