import SwiftUI

public struct CustomAlert: View {
    let title: String
    let button1: String
    let button2: String
    var action: (() -> Void)? = nil
    
    public init(title: String, button1: String, button2: String, action: (() -> Void)? = nil) {
        self.title = title
        self.button1 = button1
        self.button2 = button2
        self.action = action
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "exclamationmark.circle.fill")
                .foregroundStyle(.red)
            
            Text("Hapus profile?")
                .foregroundStyle(.red)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text("Jika profil dihapus, semua data akan hilang secara otomatis.")
                .foregroundStyle(.secondary)
                .font(.caption)
                .padding(.bottom)
            
            HStack {
                Button() {
                    action?()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.secondary, lineWidth: 1)
                        Text(button1)
                            .foregroundStyle(.secondary)
                            .fontWeight(.semibold)
                    }
                    .frame(height: 41)
                }
                .buttonStyle(.plain)
                
                Button(role: .destructive) {
                    action?()
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
        .padding()
        .padding()
        .padding()
    }
}

#Preview {
    CustomAlert(title: "Hapus profile?", button1: "Skip", button2: "Batal")
}
