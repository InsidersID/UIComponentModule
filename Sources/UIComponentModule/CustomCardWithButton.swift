//
//  ChooseCountryCard.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 08/10/24.
//

import SwiftUI

public struct CustomCardWithButton: View {
    let text:  String
    let buttonText: String
    let buttonTextFont: Font
    let paddingButtonHorizontal:  CGFloat
    let paddingButtonVertical:  CGFloat
    let buttonColor: Color
    let buttonCornerRadius: CGFloat
    let action: () -> ()

    public init(text: String, buttonText: String, buttonTextFont: Font, paddingButtonHorizontal: CGFloat, paddingButtonVertical: CGFloat, buttonColor: Color, buttonCornerRadius: CGFloat, action: @escaping () -> Void) {
        self.text = text
        self.buttonText = buttonText
        self.buttonTextFont = buttonTextFont
        self.paddingButtonHorizontal = paddingButtonHorizontal
        self.paddingButtonVertical = paddingButtonVertical
        self.buttonColor = buttonColor
        self.buttonCornerRadius = buttonCornerRadius
        self.action = action
    }
    public var body: some View {
        VStack(alignment: .center) {
            Text(text.prefix(1).capitalized + text.dropFirst())
                .multilineTextAlignment(.center)
                .frame(maxWidth: 300)
            CustomButton(text: buttonText, color: buttonColor, font: 15, cornerRadius: buttonCornerRadius, paddingHorizontal: paddingButtonHorizontal, paddingVertical: paddingButtonVertical) {
            }
        }
        .frame(width: 320)
        .padding()
    }
}

#Preview {
    CardContainer(cornerRadius: 24) {
        CustomCardWithButton(text: "Mau traveling ke negara Eropa mana saja?", buttonText: "pilih negara", buttonTextFont: .headline, paddingButtonHorizontal: 16, paddingButtonVertical: 12, buttonColor: .red, buttonCornerRadius: 24) {
            
        }
    }
}
