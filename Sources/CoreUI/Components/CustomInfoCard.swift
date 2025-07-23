//
//  DriverInfoCard.swift
//  CoreUI
//
//  Created by Sofrecom on 22/2/2025.
//

import Contacts
import ContactsUI
import SwiftUI

public struct CustomInfoCard: View {
    let details: [(label: String, info: String)]
    let radius: CGFloat
    let shadow: CGFloat
    let bgColor: Color

    public init(radius: CGFloat = 0, shadow: CGFloat = 0, bgColor: Color = .white,details: [(label: String, info: String)]) {
        self.radius = radius
        self.shadow = shadow
        self.bgColor = bgColor
        self.details = details
    }
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Informations du chauffeur")
                .font(.title2)
                .fontWeight(.semibold)

            HStack(spacing: 20) {
                CustomAsyncImage()
                VStack(spacing: 5) {
                    ForEach(details, id: \.label) { detail in
                        HStack {
                            Text(detail.label)
                                .font(.footnote)
                                .frame(alignment: .leading)
                            Spacer()
                            Text(detail.info)
                                .font(.footnote)
                                .frame(alignment: .trailing)
                        }
                    }
                }
            }
            Divider()

            Button(
                action: { addDriverToContacts() },
                label: {
                    Image(systemName: "phone.fill")
                    Text("Ajouter au Contact")
                }
            )
            .foregroundColor(.primaryColor)

        }
        .padding()
        .background(bgColor)
        .cornerRadius(radius)
        .shadow(radius: shadow)
    }

    private func addDriverToContacts() {
        let contact = CNMutableContact()

        // Extracting values from the dict
        let nom = details.first(where: { $0.label == "Nom" })?.info ?? ""
        let prenom =
            details.first(where: { $0.label == "Prénom" })?.info ?? ""
        let agence =
            details.first(where: { $0.label == "Agence" })?.info ?? ""
        let telephone =
            details.first(where: { $0.label == "Telephone" })?.info ?? ""

        contact.givenName = prenom
        contact.familyName = nom
        contact.organizationName = agence
        contact.phoneNumbers = [
            CNLabeledValue(
                label: CNLabelPhoneNumberMobile,
                value: CNPhoneNumber(stringValue: telephone))
        ]

        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier: nil)

        do {
            try store.execute(saveRequest)
            print("Contact ajouté avec succès")
        } catch {
            print(
                "Erreur lors de l'ajout du contact: \(error.localizedDescription)"
            )
        }
    }
}

#Preview {
    CustomInfoCard(details: [
        ("Nom", "N/A"),
        ("Prénom", "N/A"),
        ("Agence", "N/A"),
        ("Telephone", "N/A")
    ])
}
