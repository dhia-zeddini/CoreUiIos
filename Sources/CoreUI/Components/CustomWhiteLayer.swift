//
//  SwiftUIView.swift
//  CoreUI
//
//  Created by Sofrecom on 20/2/2025.
//

import SwiftUI

public struct CustomWhiteLayer<Content: View>: View {
    let content: () -> Content
    let title: String
    let withFooter: Bool
    public init(title: String, withFooter: Bool,@ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.title = title
        self.withFooter = withFooter
    }
    public var body: some View {
        VStack{
            Text("FindMyWay")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.top,70)
            VStack(alignment: .center, spacing: 20) {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryColor)
                    .padding(.top, paddingL)
                content()
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 5)
                    .frame(maxWidth: ScreenSize.width ,maxHeight: ScreenSize.height)
            )
            .padding(.horizontal, paddingL)
            .padding(.bottom,paddingXXXL)
        }.padding(.horizontal, withFooter ? ScreenSize.width * 0.25 : 0)
    }
}

