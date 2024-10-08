//
//  VisaApplicationCard.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 07/10/24.
//

import SwiftUI

public struct VisaApplicationCard: View {
    
    let visaType: String
    let country: String
    let date: Date
    let visaState: String
    let badgeColor: Color
    let action: () -> ()
    
    public init(visaType: String, country: String, date: Date, visaState: String, badgeColor: Color, action: @escaping () -> Void) {
        self.visaType = visaType
        self.country = country
        self.date = date
        self.visaState = visaState
        self.badgeColor = badgeColor
        self.action = action
    }
    
    public var body: some View {
        Text("Pengajuan visa \(visaType.lowercased()) \(country.capitalized)")
        Button(action: {
            action()
        }) {
            Text(visaState)
                .font(.caption)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(badgeColor)
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    VisaApplicationCard(visaType: "turis", country: "itali", date: Date(), visaState: "Belum selesai", badgeColor: .pink) {
        print("Card clicked")
    }
}
