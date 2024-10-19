import SwiftUI

public struct DocumentCard: View {
    public var width: CGFloat = .infinity
    public var height: CGFloat = 142
    public var document: String
    public var status: String
    
    public init(document: String, status: String) {
        self.document = document
        self.status = status
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: width, height: height)
                .foregroundStyle(.white)
            
            VStack(alignment: .leading) {
                Text(document)
                    .font(.system(.title2, design: .serif, weight: .bold))
                
                Spacer()
                
                Text(status)
                    .foregroundStyle(.red)
            }
            .padding()
            .frame(width: width, height: height)
        }
        .shadow(color: .black.opacity(0.1), radius: 10)
    }
}

#Preview {
    DocumentCard(document: "KTP", status: "Belum ada")
        .background(.gray)
}
