import SwiftUI

public enum DocumentStatus {
    case notStarted
    case inProgress
    case done
}

public struct DocumentCard: View {
    public var width: CGFloat = .infinity
    public var height: CGFloat
    public var document: String
    public var status: DocumentStatus
    
    private var statusText: String {
        switch status {
        case .notStarted:
            return "Upload Dokumen"
        case .inProgress:
            return "4 dari 4 bagian belum diisi"
        case .done:
            return "Selesai"
        }
    }
    
    private var statusColor: Color {
        switch status {
        case .notStarted:
            return .blue
        case .inProgress:
            return .red
        case .done:
            return .green
        }
    }
    public init(height: CGFloat = 142, document: String, status: DocumentStatus = .inProgress) {
        self.height = height
        self.document = document
        self.status = status
    }
    
    public var body: some View {
        CardContainer(cornerRadius: 24) {
            ZStack(alignment: .leading) {
//                RoundedRectangle(cornerRadius: 24)
//                    .frame(width: width, height: height)
//                    .foregroundStyle(.white)
                
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
                            Text(status == .done ? "Lihat form" : "Mulai")
                                .foregroundStyle(.blue)
                            
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
    DocumentCard(document: "Informasi tambahan", status: .inProgress)
}
