//
//  SlidingButtonBackgroundComponent.swift
//  CoreUI
//
//  Created by Sofrecom on 7/3/2025.
//


import SwiftUI

struct SlidingButtonBackgroundComponent: View {

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white.opacity(0.7))
                

            Text("Glisser pour demarrer")
                .font(.footnote)
                .bold()
                .frame(maxWidth: .infinity)
        }
        .shadow(color: Color(hex: "#D0C3C3"), radius: 3)
    }

}