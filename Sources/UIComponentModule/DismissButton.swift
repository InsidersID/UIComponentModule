//
//  SwiftUIView.swift
//  UIComponentModule
//
//  Created by hendra on 18/10/24.
//

import SwiftUI

struct DismissButton: View {
    let action: () -> ()
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "x.circle")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    DismissButton {
        print("Tes")
    }
}
