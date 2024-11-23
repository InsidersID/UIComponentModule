//
//  VisaApplicationCard.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 07/10/24.
//

import SwiftUI

public struct VisaApplicationCard: View {
    let isCompleted: Bool
    let visaType: String
    let country: String
    let countries: [String]
    let visaProgressPercentage: Double
    let visaProgressColor: Color
    let createdAt: Date
    
    public init(isCompleted: Bool, visaType: String, country: String, countries: [String], visaProgressPercentage: Double, visaProgressColor: Color, createdAt: Date, action: @escaping () -> Void) {
        self.isCompleted = isCompleted
        self.visaType = visaType
        self.country = country
        self.countries = countries
        self.visaProgressPercentage = visaProgressPercentage
        self.visaProgressColor = visaProgressColor
        self.createdAt = createdAt
    }
    
    
    public var body: some View {
        CardContainer(cornerRadius: 18) {
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Image(country)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(.horizontal)
                    }
                    VStack(alignment: .leading, spacing: 12){
                        Text("Pengajuan visa \(visaType.lowercased()) \(country.capitalized)")
                            .font(.custom("Inter-SemiBold", size: 16))
                            .foregroundStyle(Color("blackOpacity4"))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        HStack {
                            Text("\(!isCompleted ? "\(Int(visaProgressPercentage))%" : "Selesai")")
                                .font(.system(size: 14))
                                .foregroundStyle(visaProgressPercentage < 100 ? .red : .green)
                            Text("\(createdAt.formatted(date: .numeric, time: .omitted))")
                                .font(.custom("Inter-Regular", size: 14))
                                .foregroundStyle(Color("blackOpacity3"))
                        }
                    }
                    
                    Spacer()
                }
                if visaProgressPercentage <  100 {
                    VStack {
                        Rectangle()
                            .frame(width: .infinity, height: 1)
                            .foregroundStyle(Color("blackOpacity2"))
                            .padding(.horizontal, 20)
                        Text("Lanjutkan")
                            .font(.custom("Inter-Medium", size: 14))
                            .foregroundStyle(Color("primary5"))
                            .padding(.top, 4)
                    }
                }
            }
        }
    }
    
}

#Preview {
    ForEach(1..<2) { item in
        VisaApplicationCard(isCompleted: false, visaType: "turis", country: "itali", countries: ["italy", "jerman"], visaProgressPercentage: 75, visaProgressColor: .pink, createdAt: .now) {
            print("Card clicked")
        }
    }
    ForEach(0..<2) { item in
        VisaApplicationCard(isCompleted: false, visaType: "turis", country: "itali", countries: ["italy", "jerman"], visaProgressPercentage: 100, visaProgressColor: .pink, createdAt: .now) {
            print("Card clicked")
        }
    }
}
