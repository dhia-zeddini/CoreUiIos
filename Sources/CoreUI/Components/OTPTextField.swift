//
//  OTPTextField.swift
//  CoreUI
//
//  Created by Sofrecom on 15/3/2025.
//

import SwiftUI
import Combine
/// `OTPTextField` is a hidden text field for handling OTP input logic.
///
/// It automatically detects when the required number of digits has been entered and triggers the `onComplete` action.
///
/// - Parameters:
///   - verificationCode: A binding that tracks the user's input.
///   - pinLength: The required OTP length (default is 6).
///   - keyboardType: Keyboard type for the input (default is `.numberPad`).
///   - onComplete: Closure triggered when OTP is completed.
struct OTPTextField: View {
    @FocusState private var keyboardFocusedField: FocusField?
    @Binding var verificationCode: String
    @State var isAllNumbersFilled: Bool = false

    var pinLength: Int = 6
    var keyboardType: UIKeyboardType = .numberPad
    var onComplete: () -> Void

    var body: some View {
        ZStack {
            TextField("", text: $verificationCode)
                .frame(width: 0, height: 0, alignment: .center)
                .font(Font.system(size: 0))
                .accentColor(.primaryColor)
                .foregroundColor(.primaryColor)
                .multilineTextAlignment(.center)
                .keyboardType(keyboardType)
                .focused($keyboardFocusedField, equals: .field)
                .padding()
                .task {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.keyboardFocusedField = .field
                    }
                }
                .onReceive(Just(verificationCode)) { _ in
                    if verificationCode.count > pinLength {
                        verificationCode = String(
                            verificationCode.prefix(pinLength))
                    }

                    if verificationCode.count == pinLength
                        && !isAllNumbersFilled
                    {
                        isAllNumbersFilled = true
                        onComplete()
                    } else if verificationCode.count < pinLength {
                        isAllNumbersFilled = false
                    }
                }
        }
    }
}
