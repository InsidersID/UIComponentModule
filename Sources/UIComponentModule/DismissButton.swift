import SwiftUI

struct DismissButton: View {
    let action: () -> ()
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "x.circle")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    DismissButton {
        print("Tes")
    }
}
