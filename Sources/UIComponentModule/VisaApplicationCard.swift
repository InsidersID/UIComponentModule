//
//  VisaApplicationCard.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 07/10/24.
//

import HealthKit
import SwiftUI

public struct VisaApplicationCard: View {
    
    let visaType: String
    let country: String
    let countries: [String]
    let visaProgressPercentage: Double
    let visaProgressColor: Color
    let action: () -> ()
    
    public init(visaType: String, country: String, countries: [String], visaProgressPercentage: Double, visaProgressColor: Color, action: @escaping () -> Void) {
        self.visaType = visaType
        self.country = country
        self.countries = countries
        self.visaProgressPercentage = visaProgressPercentage
        self.visaProgressColor = visaProgressColor
        self.action = action
    }
    
    
    public var body: some View {
        CardContainer(cornerRadius: 25) {
            HStack(spacing: 20) {
                VStack {
                    Image(systemName: "pengajuanvisa-\(country)")
                }
                VStack(alignment: .leading){
                    Text("Pengajuan visa")
                        .font(.headline)
                    Text("\(visaType.lowercased()) \(country.capitalized)")
                        .font(.headline)
                    Text(countries.joined(separator: ", "))
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        
                }
                VStack {
                    CustomGauge(visaProgressPercentage: visaProgressPercentage, visaProgressColor: visaProgressColor, lineWidth: 10, size: 70)
                }
            }
        }
    }
    
}

#Preview {
    VisaApplicationCard(visaType: "turis", country: "itali", countries: ["italy", "jerman"], visaProgressPercentage: 75, visaProgressColor: .pink) {
        print("Card clicked")
    }
}
