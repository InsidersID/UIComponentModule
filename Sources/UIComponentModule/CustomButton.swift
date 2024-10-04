//
//  RedButton.swift
//  Servisa
//
//  Created by Nur Nisrina on 24/09/24.
//

import SwiftUI

public struct CustomButton: View {
    
    let text: String
    let isPrimary: Bool
    let color: Color
    let action: () -> ()
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(color)
        .foregroundColor(.white)
        .cornerRadius(14)
        .padding()
    }
}

#Preview {
    CustomButton(text: "Ini button", isPrimary: true, color: .red) {
        print("tes")
    }
}
