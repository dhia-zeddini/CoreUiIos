//
//  BackButton.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 12/4/2025.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack(alignment: .top){
            Button(
                action: {
                    presentationMode.wrappedValue.dismiss()
                },
                label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.primaryColor)
                        .font(.title2)
                })
            Spacer()
        }.padding(.vertical)
    }
}
