//
//  Badge.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 07/10/24.
//

import SwiftUI

public struct Badge: View {
    let paddingHorizontal: CGFloat
    let paddingVertical: CGFloat
    let text: String
    let backgroundColor: Color
    let color: Color?
    let height: CGFloat = 20
    
    public init(paddingHorizontal: CGFloat, paddingVertical: CGFloat, text: String, backgroundColor: Color, color: Color) {
        self.paddingHorizontal = paddingHorizontal
        self.paddingVertical = paddingVertical
        self.text = text
        self.backgroundColor = backgroundColor
        self.color = color
    }
    
    public var body: some View {
        Text(text.prefix(1).uppercased() + text.dropFirst())
            .font(.caption)
            .padding(.horizontal, paddingHorizontal)
            .padding(.vertical, paddingVertical - 4)
            .background(backgroundColor.opacity(0.5))
            .foregroundColor(color)
            .cornerRadius( (height + paddingVertical * 2) / 2)
            .frame(height: height)
    }
}

#Preview {
    Badge(paddingHorizontal: 8, paddingVertical: 8, text: "belum selesai", backgroundColor: .pink, color: .white )
}
