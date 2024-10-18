//
//  RedButton.swift
//  Servisa
//
//  Created by Nur Nisrina on 24/09/24.
//

import SwiftUI

public struct CustomButton: View {

    let text: String
    var textColor: Color
    let color: Color
    let font: CGFloat
    let cornerRadius: CGFloat
    let paddingHorizontal: CGFloat
    let paddingVertical: CGFloat
    let action: () -> ()
    
    public init(text: String,textColor: Color = .white, color: Color, font: CGFloat, cornerRadius: CGFloat = 14, paddingHorizontal: CGFloat, paddingVertical: CGFloat, action: @escaping () -> Void) {
        self.text = text
        self.textColor = textColor
        self.color = color
        self.font = font
        self.action = action
        self.cornerRadius = cornerRadius
        self.paddingHorizontal = paddingHorizontal
        self.paddingVertical = paddingVertical
    }
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            Text(text.prefix(1).capitalized + text.dropFirst())
                .font(.system(size: font))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .background(color)
        .foregroundColor(textColor)
        .cornerRadius(cornerRadius)
        .padding(.horizontal)
    }
}

#Preview {
    CustomButton(text: "ini button", color: .red, font: 12, cornerRadius: 14, paddingHorizontal: 4, paddingVertical: 8) {
        print("tes")
    }
}
