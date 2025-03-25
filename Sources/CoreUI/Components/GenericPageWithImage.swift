//
//  GenericPageWithImage.swift
//  CoreUI
//
//  Created by Sofrecom on 19/2/2025.
//


import SwiftUI

public struct GenericPageWithImage: View {
    let page : OnboradingModel
    public var body: some View {
        VStack(spacing : 50){
            MagnifiableImage(image: Image(page.image, bundle: .main))
                  .frame(height: ScreenSize.height13)
                  .cornerRadius(20)
                
            VStack(spacing : 30){
                Text(page.label)
                    .font(.title)
                Text(page.text)
                    .multilineTextAlignment(.center)
            }.padding(paddingS)
        }
    }
}





struct MagnifiableImage: View {
    let image: Image
    
    @State private var loupeCenter: CGPoint = .zero
    
    private let magnificationScale: CGFloat = 3.0
    
    private let loupeDiameter: CGFloat = 100
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
                
                ZStack {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: proxy.size.width * magnificationScale,
                               height: proxy.size.height * magnificationScale)
                        .offset(
                            x: -loupeCenter.x * (magnificationScale - 1),
                            y: -loupeCenter.y * (magnificationScale - 1)
                        )
                }
                .frame(width: loupeDiameter, height: loupeDiameter)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 5)
                .position(loupeCenter)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newX = min(max(value.location.x, 0), proxy.size.width)
                            let newY = min(max(value.location.y, 0), proxy.size.height)
                            loupeCenter = CGPoint(x: newX, y: newY)
                        }
                )
            }
            .onAppear {
                loupeCenter = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
            }
        }
    }
}
