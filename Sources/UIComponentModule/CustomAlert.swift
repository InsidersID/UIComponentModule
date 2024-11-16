import SwiftUI

public struct CustomAlert: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let caption: String
    let button1: String
    let button2: String
    var action1: (() -> Void)? = nil
    var action2: (() -> Void)? = nil
    
    public init(title: String, caption: String, button1: String, button2: String, action1: (() -> Void)? = nil, action2: (() -> Void)? = nil) {
        self.title = title
        self.caption = caption
        self.button1 = button1
        self.button2 = button2
        self.action1 = action1
        self.action2 = action2
    }
    
    public var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    if button1 == "Skip" {
                        action1?()
                        dismiss()
                    } else {
                        action2?()
                        dismiss()
                    }
                }
            
            VStack {
                Image("alert_asset")
                    .resizable()
                    .frame(width: 87, height: 82)
                
                Text(title)
                    .foregroundStyle(Color("danger5", bundle: .main))
                    .font(.custom("Inter-Bold", size: 19))
                    .padding(.bottom)
                
                Text(caption)
                    .foregroundStyle(Color("blackOpacity3", bundle: .main))
                    .font(.custom("Inter-Regular", size: 14))
                    .padding(.bottom)
                
                HStack {
                    Button() {
                        action1?()
                        dismiss()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("white", bundle: .main))
                                .stroke(Color("blackOpacity2", bundle: .main), lineWidth: 1)
                            Text(button1)
                                .foregroundStyle(button1 == "Skip" ? Color("blackOpacity2", bundle: .main) : Color("danger5", bundle: .main))
                                .font(.custom("Inter-SemiBold", size: 14))
                        }
                        .frame(height: 41)
                    }
                    .buttonStyle(.plain)
                    
                    Button(role: .destructive) {
                        action2?()
                        dismiss()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("danger5", bundle: .main))
                            Text(button2)
                                .foregroundStyle(Color("white", bundle: .main))
                                .font(.custom("Inter-SemiBold", size: 14))
                        }
                        .frame(height: 42)
                    }
                }
            }
            .padding()
            .cornerRadius(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color("white", bundle: .main))
            )
            .padding()
            .padding()
        }
    }
}

#Preview {
    CustomAlert(title: "Hapus profil?", caption: "Jika profil dihapus, semua data akan hilang secara otomatis.", button1: "Hapus", button2: "Batal")
}
