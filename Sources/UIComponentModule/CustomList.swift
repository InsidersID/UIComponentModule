import SwiftUI

public enum ChecklistStatus {
    case done
    case undone
}

public struct CustomList: View {
    public var height: CGFloat = 46
    public var text: String
    public var isChecklist: Bool = true
    public var checklistStatus: ChecklistStatus = .done
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: .infinity, height:height)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            
            HStack {
                Text(text)
                    .fontWeight(.semibold)
                
                Spacer()
                
                if isChecklist {
                    Image(systemName: checklistStatus == .done ? "checkmark.circle.fill" : "exclamationmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(checklistStatus == .done ? .green : .yellow)
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomList(text: "Masukkan identitas baru")
}
