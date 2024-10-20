//
//  SwiftUIView.swift
//  UIComponentModule
//
//  Created by Balya Elfata on 20/10/24.
//

import SwiftUI

struct NotificationCard: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.1), radius: 10)
                
                HStack {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.green)
                    
                    VStack(alignment: .leading) {
                        Text("Entry berhasil dibuat!")
                        Text("Pengajuan bisa dilihat di tab Visaku")
                            .foregroundStyle(.secondary)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Image(systemName: "xmark")
                    .offset(x: proxy.size.width*0.32, y: -proxy.size.height*0.025)
            }
            .frame(width: proxy.size.width*0.8, height: proxy.size.height*0.1)
        }
    }
}

#Preview {
    NotificationCard()
}
