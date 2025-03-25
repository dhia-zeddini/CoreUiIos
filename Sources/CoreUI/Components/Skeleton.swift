//
//  Skeleton.swift
//  CoreUI
//
//  Created by Sofrecom on 18/3/2025.
//

import SwiftUI

public struct Skeleton: View {
    let text:String
    public init(text: String = "Loading, Please wait ...") {
        self.text = text
    }
    public var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea()
            VStack {
                Text(text)
                ProgressView()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding()
        }
    }
}

#Preview {
    Skeleton()
}
