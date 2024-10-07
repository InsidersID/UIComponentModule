import SwiftUI

enum ChecklistStatus {
    case done
    case undone
}

public struct CustomList: View {
    var height: CGFloat = 46
    var text: String
    var isChecklist: Bool = false
    var checklistStatus: ChecklistStatus = .undone
    var isAddItem: Bool = false
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: .infinity, height: isAddItem ? 48 : height)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
            
            HStack {
                if isAddItem {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.blue)
                        .font(.title)
                }
                
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
