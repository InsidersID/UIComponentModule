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
    let font: String
    let fontSize: CGFloat
    let cornerRadius: CGFloat
    let paddingHorizontal: CGFloat
    let paddingVertical: CGFloat
    let action: () -> ()
    
    public init(
        text: String,
        textColor: Color = .white,
        color: Color = Color.primary,
        buttonWidth: CGFloat = .infinity,
        buttonHeight: CGFloat = 26,
        font: String = "Inter-Regular",
        fontSize: CGFloat = 17,
        cornerRadius: CGFloat = 14,
        paddingHorizontal: CGFloat = 16,
        paddingVertical: CGFloat = 16,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.textColor = textColor
        self.color = color
        self.buttonWidth = buttonWidth
        self.buttonHeight = buttonHeight
        self.font = font
        self.fontSize = fontSize
        self.cornerRadius = cornerRadius
        self.paddingHorizontal = paddingHorizontal
        self.paddingVertical = paddingVertical
        self.action = action
    }
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            Text(text.prefix(1).capitalized + text.dropFirst())
                .font(Font.custom(font, size: fontSize))
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
    CustomButton(text: "Batal", color: .red, fontSize: 17){
        print("tes")
    }
}

