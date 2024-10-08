//
//  Badge.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 07/10/24.
//

import SwiftUI

public struct Tag: View {
    let padding: CGFloat
    let text: String
    let height: CGFloat = 20
    let pVertical:CGFloat = 8
    var body: some View {
        Text(text)
            .fixedSize()
            .padding(.horizontal, padding)
            .padding(.vertical, pVertical)
            .background(Color.orange.opacity(0.2))
            .foregroundColor(Color.orange)
            .cornerRadius( (height + pVertical * 2) / 2)
            .frame(height: height)
    }
}


#Preview {
    SwiftUIView_2()
}
