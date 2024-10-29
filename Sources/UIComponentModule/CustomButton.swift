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
    let buttonHeight: CGFloat
    let font: CGFloat
    let cornerRadius: CGFloat
    let paddingHorizontal: CGFloat
    let paddingVertical: CGFloat
    let action: () -> ()
    
    public init(text: String,textColor: Color = .white, color: Color, buttonHeight: CGFloat = 50, font: CGFloat = 17, cornerRadius: CGFloat = 14, paddingHorizontal: CGFloat = 4, paddingVertical: CGFloat = 8, action: @escaping () -> Void) {
        self.text = text
        self.textColor = textColor
        self.color = color
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
                .font(.system(size: font))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, maxHeight: buttonHeight)
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
    CustomButton(text: "ini button", color: .red) {
        print("tes")
    }
}
