//
//  LinearProgressView.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 10/4/2025.
//

import SwiftUI

public struct LinearProgressView: View {
    public init(){}
    public var body: some View {
        HStack(alignment: .top) {
            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 70, height: 70)
                .padding(.trailing, 8)
                .shimmer()

            VStack(alignment: .leading, spacing: 8) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 16)
                    .frame(maxWidth: 150)
                    .shimmer()

                ForEach(0..<2) { _ in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 14)
                        .frame(maxWidth: 200)
                        .shimmer()
                }
            }
            .padding(.vertical, 8)

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

#Preview {
    LinearProgressView()
}


