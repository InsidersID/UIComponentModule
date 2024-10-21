//
//  SwiftUIView.swift
//  UIComponentModule
//
//  Created by Balya Elfata on 20/10/24.
//

import SwiftUI

public struct NotificationCard: View {
    @Environment(\.colorScheme) var colorScheme
    @State public var deleteNotification: Bool = false
    
    public init() {}
    
    public var body: some View {
        GeometryReader { proxy in
            if deleteNotification {EmptyView()} else {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.1), radius: 10)
                    
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.green)
                        
                        VStack(alignment: .leading) {
                            Text("Entry berhasil dibuat!")
                                .foregroundStyle(colorScheme == .dark ? Color.black : .black)
                            Text("Pengajuan bisa dilihat di tab Visaku")
                                .foregroundStyle(colorScheme == .dark ? Color.black : .secondary)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Image(systemName: "xmark")
                        .offset(x: proxy.size.width*0.32, y: -proxy.size.height*0.025)
                        .foregroundStyle(.gray)
                        .onTapGesture {
                            deleteNotification = true
                        }
                }
                .frame(width: proxy.size.width*0.8, height: proxy.size.height*0.1)
            }
        }
    }
}

#Preview {
    NotificationCard()
}
