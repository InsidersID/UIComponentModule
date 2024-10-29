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
        CardContainer(cornerRadius: 18) {
            VStack {
                HStack {
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())

                    }
                    VStack(alignment: .leading, spacing: 12){
                        Text("Pengajuan visa \(visaType.lowercased()) \(country.capitalized)")
                            .font(.headline)
                        HStack {
                            Text("\(visaProgressPercentage < 100 ? "\(Int(visaProgressPercentage))%" : "Selesai")")
                                .foregroundStyle(visaProgressPercentage < 100 ? .red : .green)
                            Text("\(Date.now.formatted(date: .numeric, time: .omitted))")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding()
                }
                if visaProgressPercentage <  100 {
                    Divider()
                        .padding(.horizontal, 20)
                    Button(action: {
                        
                    }, label: {
                        Text("Lanjutkan")
                            .padding(.top, 4)
                            .font(.system(size: 16))
                    })
                }
            }
            .padding(.vertical, 12)
        }
    }
    
}

#Preview {
    ForEach(1..<3) { item in
        VisaApplicationCard(visaType: "turis", country: "itali", countries: ["italy", "jerman"], visaProgressPercentage: 75, visaProgressColor: .pink) {
            print("Card clicked")
        }
    }
    ForEach(0..<2) { item in
        VisaApplicationCard(visaType: "turis", country: "itali", countries: ["italy", "jerman"], visaProgressPercentage: 100, visaProgressColor: .pink) {
            print("Card clicked")
        }
    }
}
