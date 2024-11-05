//
//  RedButton.swift
//  Servisa
//
//  Created by Nur Nisrina on 24/09/24.
//

import SwiftUI

public struct CustomButton: View {

    let text: String
    let textColor: Color
    let color: Color
    let buttonWidth: CGFloat
    let buttonHeight: CGFloat
    let font: CGFloat
    let cornerRadius: CGFloat
    let paddingHorizontal: CGFloat
    let paddingVertical: CGFloat
    let action: () -> ()
    
    public init(text: String,textColor: Color = .white, color: Color = Color.primary, buttonWidth: CGFloat = 36, buttonHeight: CGFloat = 36, font: CGFloat, cornerRadius: CGFloat = 14, paddingHorizontal: CGFloat, paddingVertical: CGFloat, action: @escaping () -> Void) {
        self.text = text
        self.textColor = textColor
        self.color = color
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
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
                .font(Font.custom("Inter", size: font))
                .fontWeight(.semibold)
                .frame(maxWidth: buttonWidth, maxHeight: buttonHeight)
        }
        .padding(.horizontal, paddingHorizontal)
        .padding(.vertical, paddingVertical)
        .background(color)
        .foregroundColor(textColor)
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    CustomButton(text: "ini button", color: .red, font: 18, paddingHorizontal: 16, paddingVertical: 8) {
        print("tes")
    }
}
