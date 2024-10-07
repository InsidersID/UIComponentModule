//
//  SwiftUIView.swift
//  UIComponentModule
//
//  Created by Balya Elfata on 07/10/24.
//

import SwiftUI

struct OnboardingPageIndicator: View {
    var pageIndex: Int
    
    var body: some View {
        HStack {
            Image(systemName: pageIndex == 1 ? "circle.fill" : "circle")
            Image(systemName: pageIndex == 2 ? "circle.fill" : "circle")
            Image(systemName: pageIndex == 3 ? "circle.fill" : "circle")
            Image(systemName: pageIndex == 4 ? "circle.fill" : "circle")
        }
        .fontWeight(.black)
        .foregroundStyle(.red)
    }
}

#Preview {
    OnboardingPageIndicator(pageIndex: 1)
}
