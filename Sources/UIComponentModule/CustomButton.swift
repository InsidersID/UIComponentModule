//
//  RedButton.swift
//  Servisa
//
//  Created by Nur Nisrina on 24/09/24.
//

import SwiftUI

public struct CustomButton: View {

    let text: String
    let color: Color
    let cornerRadius: CGFloat
    let action: () -> ()
    
    public init(text: String, color: Color, cornerRadius: CGFloat, action: @escaping () -> Void) {
        self.text = text
        self.color = color
        self.action = action
        self.cornerRadius = cornerRadius
    }
    
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
        .cornerRadius(cornerRadius)
        .padding()
    }
}

#Preview {
    CustomButton(text: "Ini button", color: .red, cornerRadius: 14) {
        print("tes")
    }
}
