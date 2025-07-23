//
//  OTPTextFieldView.swift
//  CoreUI
//
//  Created by Sofrecom on 15/3/2025.
//
import SwiftUI

/// `OTPTextFieldView` is a custom input field for OTP entry.
///
/// It handles user input for OTP digits and triggers an action when the full OTP is entered.
///
/// - Parameters:
///   - pinLength: The number of digits required for the OTP (default is 6).
///   - keyboardType: The keyboard type for input (default is `.numberPad`).
///   - onComplete: A closure that is called when the user finishes entering the OTP.
///
/// # Example
/// ```
/// OTPTextFieldView(pinLength: 6, keyboardType: .numberPad) { pin in
///     print("OTP Entered: \(pin)")
/// }
/// ```
public struct OTPTextFieldView: View {
    @State private var verificationCode = ""
    @FocusState private var focusedField: FocusField?

    var pinLength: Int 
    var keyboardType: UIKeyboardType
    var onComplete: (String) -> Void
    public init(pinLength: Int = 6, keyboardType: UIKeyboardType  = .numberPad, onComplete: @escaping (String) -> Void) {
        self.pinLength = pinLength
        self.keyboardType = keyboardType
        self.onComplete = onComplete
    }
    public var body: some View {
        ZStack(alignment: .center) {
            OTPTextField(
                verificationCode: $verificationCode, pinLength: pinLength,
                keyboardType: keyboardType
            ) {
                onComplete(verificationCode)
            }
            HStack {
                ForEach(0..<pinLength, id: \.self) { index in
                    ZStack {
                        Text(getPin(at: index))

                            .fontWeight(.semibold)
                           // .foregroundColor(.primaryColor)
                    }.padding()
                        .frame(width: 45, height: 45)
                        .background(Color.white.cornerRadius(10))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primaryColor, lineWidth: 2)
                        )

                }
            }
        }
    }

    func getPin(at index: Int) -> String {
        guard self.verificationCode.count > index else {
            return ""
        }

        return String(verificationCode[index])
    }

}
