//
//  CardContainer.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 08/10/24.
//

import SwiftUI

public struct CardContainer<Content: View>: View {
    let cornerRadius: CGFloat
    let content: () -> Content
    
    var shadowColor = Color(.black.opacity(0.1))
    var shadowRadius = 5

    public init(cornerRadius: CGFloat,
                @ViewBuilder content: @escaping () -> Content) {
        self.cornerRadius = cornerRadius
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.white)
                .shadow(color: shadowColor, radius: CGFloat(shadowRadius), x: 0, y: 0)
            content()
        }
        .padding()
        .fixedSize(horizontal: false, vertical: false)
    }
}
#Preview {
    VStack {
        CardContainer(cornerRadius: 16) {
            Text("A card container")
        }
        CardContainer(cornerRadius: 16) {
            Text("A card container")
        }
        CardContainer(cornerRadius: 16) {
            Text("A card container")
        }
        HStack {
            CardContainer(cornerRadius: 16) {
                Text("A card container")
            }
            CardContainer(cornerRadius: 16) {
                Text("A card container")
            }
            CardContainer(cornerRadius: 16) {
                Text("A card container")
            }
        }
    }
    
    
    
}
