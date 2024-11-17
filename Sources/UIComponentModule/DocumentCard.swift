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
    public var requiresMarkOnly: Bool
    
    private var statusText: String {
        switch status {
        case .undone:
            if document == "Informasi tambahan" {
                return "4 dari 4 bagian belum diisi"
            }
            return requiresMarkOnly ? "Tandai Ada" : "Upload Dokumen"
        case .done:
            return "Selesai"
        }
    }
    
    private var statusColor: Color {
        switch status {
        case .undone:
            if document == "Informasi tambahan" {
                return Color("danger4", bundle: .main)
            }
            return Color("primary5", bundle: .main)
        case .done:
            return Color("success6", bundle: .main)
        }
    }
    public init(width: CGFloat = .infinity, height: CGFloat = 114, document: String, status: DocumentStatus = .done, requiresMarkOnly: Bool = false) {
        self.width = width
        self.height = height
        self.document = document
        self.status = status
        self.requiresMarkOnly = requiresMarkOnly
    }
    
    public var body: some View {
        CardContainer(cornerRadius: 24) {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(document)
                            .font(Font.custom("Inter-SemiBold", size: 16))
                            .foregroundStyle(Color("black", bundle: .main))
                            .multilineTextAlignment(.leading)
                        
                        if document != "Informasi tambahan" {
                            Text(statusText)
                                .font(Font.custom("Inter-Medium", size: 14))
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
                                    .font(Font.custom("Inter-Medium", size: 14))
                                    .foregroundStyle(Color(red: 0, green: 0.55, blue: 0.85))
                            }
                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(document == "Informasi tambahan" ? Color(red: 0, green: 0.55, blue: 0.85) : Color(red: 0.04, green: 0.04, blue: 0.04).opacity(0.5))
                            //                                .fontWeight(.semibold)
                        }
                    }
                }
                
                Spacer()
                
                if document == "Informasi tambahan" || document == "Form aplikasi" {
                    Text(statusText)
                        .font(Font.custom("Inter-Medium", size: 14))
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
