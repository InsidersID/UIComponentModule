//
//  CustomGauge.swift
//  UIComponentModule
//
//  Created by Nur Nisrina on 18/10/24.
//

import SwiftUI

struct CustomGauge: View {
    
    var visaProgressPercentage: Double
    var visaProgressColor: Color
    var lineWidth: CGFloat
    var size: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(visaProgressColor.opacity(0.5), lineWidth: lineWidth)
                .frame(width: size, height: size)
            
            Circle()
                .trim(from: 0, to: visaProgressPercentage/100)
                .stroke(visaProgressColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .frame(width: size, height: size)
                .animation(.easeInOut, value: visaProgressPercentage)
            Text("\(Int(visaProgressPercentage))%")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(visaProgressColor)
                .frame(width: size, height: size)
        }
    }
}

#Preview {
    CustomGauge(visaProgressPercentage: 75, visaProgressColor: .pink, lineWidth: 10, size: 70)
}
