import SwiftUI

public struct NotificationCard: View {
    @Environment(\.colorScheme) var colorScheme
    @State public var deleteNotification: Bool = false
    
    let icon: String
    let title: String
    let subtitle: String
    
    public init(icon: String, title: String, subtitle: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
    
    public var body: some View {
        GeometryReader { proxy in
            if deleteNotification {EmptyView()} else {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.1), radius: 10)
                    
                    HStack {
                        Image(systemName: icon)
                            .foregroundStyle(.green)
                        
                        VStack(alignment: .leading) {
                            Text(title)
                                .foregroundStyle(colorScheme == .dark ? Color.black : .black)
                            Text(subtitle)
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
