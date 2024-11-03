import SwiftUI

public enum DocumentStatus {
    case undone
    case done
}

public struct DocumentCard: View {
    public var width: CGFloat = .infinity
    public var height: CGFloat
    public var document: String
    public var status: DocumentStatus
    
    private var statusText: String {
        switch status {
        case .undone:
            if document == "Informasi tambahan" {
                return "4 dari 4 bagian belum diisi"
            }
            return "Upload Dokumen"
        case .done:
            return "Selesai"
        }
    }
    
    private var statusColor: Color {
        switch status {
        case .undone:
            if document == "Informasi tambahan" {
                return .red
            }
            return .blue
        case .done:
            return .green
        }
    }
    public init(height: CGFloat = 142, document: String, status: DocumentStatus = .done) {
        self.height = height
        self.document = document
        self.status = status
    }
    
    public var body: some View {
        CardContainer(cornerRadius: 24) {
            ZStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(document)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Spacer()
                        
                        Text(statusText)
                            .foregroundStyle(statusColor)
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            if document == "Informasi tambahan" {
                                Text(status == .done ? "Lihat form" : "Mulai")
                                    .foregroundStyle(.blue)
                            }
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(document == "Informasi tambahan" ? .blue : .secondary)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        
                        if document == "Informasi tambahan" {
                            Spacer()
                        }
                    }
                }
                .padding()
                .frame(width: width, height: height)
            }
        }
    }
}

#Preview {
    DocumentCard(document: "Informasi tambahan", status: .undone)
}
