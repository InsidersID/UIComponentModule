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
            content()
                .padding()
        }
        .fixedSize(horizontal: false, vertical: false)
//        .background(Color("white", bundle: .main))
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color("blackOpacity2"), lineWidth: 1)
            //                .stroke(.gray, lineWidth: 1)
        )
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
