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
    let countries: [String]
    let action: () -> ()
    
    public init(visaType: String, country: String, date: Date, visaState: String, badgeColor: Color, countries: [String], action: @escaping () -> Void) {
        self.visaType = visaType
        self.country = country
        self.date = date
        self.visaState = visaState
        self.badgeColor = badgeColor
        self.countries = countries
        self.action = action
    }
    
    public var body: some View {
        VStack(alignment: .leading){
            Text("Pengajuan visa \(visaType.lowercased()) \(country.capitalized)")
                .font(.headline)
                .padding(.vertical, 1)
            Text(countries.joined(separator: ", "))
                .font(.subheadline)
            Badge(paddingHorizontal: 8, paddingVertical: 8, text: visaState, backgroundColor: .pink, color: .white)
        }
    }
}

#Preview {
    VisaApplicationCard(visaType: "turis", country: "itali", date: Date(), visaState: "Belum selesai", badgeColor: .pink, countries: ["Italia", "Jerman"]) {
        print("Card clicked")
    }
}
