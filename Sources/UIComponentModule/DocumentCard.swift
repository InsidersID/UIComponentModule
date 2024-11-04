import SwiftUI

public enum DocumentStatus {
    case undone
    case done
}

public struct DocumentCard: View {
    public var width: CGFloat
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
    public init(width: CGFloat = .infinity, height: CGFloat = 114, document: String, status: DocumentStatus = .done) {
        self.width = width
        self.height = height
        self.document = document
        self.status = status
    }
    
    public var body: some View {
        CardContainer(cornerRadius: 24) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(document)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.leading)
                        
                        if document != "Informasi tambahan" {
                            Text(statusText)
                                .font(.subheadline)
                                .foregroundStyle(statusColor)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                        }
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
                            //                                .fontWeight(.semibold)
                        }
                    }
                }
                
                Spacer()
                
                if document == "Informasi tambahan" {
                    Text(statusText)
                        .font(.subheadline)
                        .foregroundStyle(statusColor)
                }
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    DocumentCard(document: "Informasi tambahan", status: .undone)
        .padding(.horizontal)
    HStack {
        DocumentCard(document: "Rekening Koran", status: .done)
        DocumentCard(document: "Tiket pesawat", status: .undone)
    }
    .padding(.horizontal)
}
