//
//  CustomAsyncImage.swift
//  CoreUI
//
//  Created by Sofrecom on 4/3/2025.
//

import SwiftUI

public struct CustomAsyncImage: View {
    var imageUrl: String
    var size: CGFloat
    var strockeWidth: CGFloat
    var strockeColor: Color
    public init(
        imageUrl: String =
            "https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        size: CGFloat = 70,
        strockeWidth: CGFloat = 0,
        strockeColor: Color = Color.primaryColor
    ) {
        self.imageUrl = imageUrl
        self.size = size
        self.strockeWidth = strockeWidth
        self.strockeColor = strockeColor
    }
    public var body: some View {
        AsyncImage(
            url: URL(string: imageUrl)
        ) { image in
            image.resizable()
                .frame(width: size, height: size)
                .clipShape(Circle())
                .overlay(Circle().stroke(strockeColor, lineWidth: strockeWidth))
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    CustomAsyncImage()
}
