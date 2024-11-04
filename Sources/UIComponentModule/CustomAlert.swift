import SwiftUI

public struct CustomAlert: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    let button1: String
    let button2: String
    var action1: (() -> Void)? = nil
    var action2: (() -> Void)? = nil
    
    public init(title: String, button1: String, button2: String, action1: (() -> Void)? = nil, action2: (() -> Void)? = nil) {
        self.title = title
        self.button1 = button1
        self.button2 = button2
        self.action1 = action1
        self.action2 = action2
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.75)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
            VStack {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundStyle(.red)
                    .font(.title)
                
                Text("Hapus profil?")
                    .foregroundStyle(.red)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("Jika profil dihapus, semua data akan hilang secara otomatis.")
                    .foregroundStyle(.secondary)
                    .font(.callout)
                    .padding(.bottom)
                
                HStack {
                    Button() {
                        action1?()
                        dismiss()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.white)
                                .stroke(.secondary, lineWidth: 1)
                            Text(button1)
                                .foregroundStyle(button1 == "Skip" ? Color.secondary : Color.red)
                                .fontWeight(.semibold)
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
                            Text(button2)
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                        .frame(height: 42)
                    }
                }
            }
            .padding()
            .cornerRadius(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(.white)
            )
            .padding()
            .padding()
        }
    }
}

#Preview {
    CustomAlert(title: "Hapus profile?", button1: "Hapus", button2: "Batal")
}
