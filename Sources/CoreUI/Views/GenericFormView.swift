//
//  GenericFormView.swift
//  CoreUI
//
//  Created by Zeddin Dhia on 12/4/2025.
//


import SwiftUI

/// `GenericFormView` is a reusable form container that lets you compose arbitrary input fields.
/// This view provides a header, a form container (using a view builder), and a confirm button with an action.
/// You can supply any inputs (text fields, pickers, date pickers, etc.) into the form.
public struct GenericFormView<Content: View>: View {
    /// The header title of the form.
    let headerTitle: String
    /// The text for the confirm button.
    let confirmLabel: String?

    /// A Binding bool variable to indicate id the form is disabled.
    @Binding var formDisabled: Bool
    
    let isEditing: Bool
    /// A view builder closure that provides the form content.
    let content: () -> Content
    /// The action to execute when the confirm button is tapped.
    let confirmAction: () -> Void
    
    /// The action to execute when the view appears.
    let onAppearAction: (() -> Void)?
    /// The action to execute when the view disappers
    let onDisappearAction: (() -> Void)?


    public init(
        headerTitle: String,
        confirmLabel: String? = nil,
        formDisabled: Binding<Bool> = .constant(false),
        isEditing: Bool = false,
        @ViewBuilder content: @escaping () -> Content,
        confirmAction: @escaping () -> Void,
        onAppearAction: (() -> Void)? = nil,
        onDisappearAction: (() -> Void)? = nil
    ) {
        self.headerTitle = headerTitle
        self.confirmLabel = confirmLabel
        self._formDisabled = formDisabled
        self.isEditing = isEditing
        self.content = content
        self.confirmAction = confirmAction
        self.onAppearAction = onAppearAction
        self.onDisappearAction = onDisappearAction
    }

    public var body: some View {
        VStack(spacing: 16) {
            // Form header
            HStack{
                Spacer()
                Text(headerTitle)
                    .font(.title2.bold())
                    .foregroundColor(.primaryColor)
                    .padding(.top, 16)
                Spacer()
                if isEditing {
                    Button(action:{
                        formDisabled.toggle()
                    }){
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.primaryColor)
                    }
                }
            }.padding(.horizontal)
            
            // Render custom form content provided by the caller.
            Form {
                content()
            }
            .listStyle(GroupedListStyle())
            .disabled(formDisabled)
            
            // Confirm button
            if !formDisabled , let label = confirmLabel {
                PrimaryButton(label: label, action: confirmAction)
                    .padding(.bottom, paddingL)
                    .padding(.horizontal,paddingL)
            }
        }.onAppear(perform: onAppearAction)
            .onDisappear(perform: onDisappearAction)
    }
}
