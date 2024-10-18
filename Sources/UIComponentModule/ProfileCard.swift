import SwiftUI

public struct ProfileCard: View {
    public var width: CGFloat = 170.5
    public var height: CGFloat = 224
    public var photoWidth: CGFloat = 146.5
    public var photoHeight: CGFloat = 140
    public var name: String = "Iqbal Setiawan"
    
    public init(width: CGFloat, height: CGFloat, photoWidth: CGFloat, photoHeight: CGFloat, name: String) {
        self.width = width
        self.height = height
        self.photoWidth = photoWidth
        self.photoHeight = photoHeight
        self.name = name
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: width, height: height)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 10)
            VStack {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: photoWidth, height: photoHeight)
                
                Spacer()
                
                HStack {
                    Text(name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image(systemName: "checkmark")
                        .foregroundStyle(.green)
                }
            }
            .padding()
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    ProfileCard(width: 170.5, height: 224, photoWidth: 146.5, photoHeight: 140, name: "Iqbal Setiawan")
        .background(Color.gray.ignoresSafeArea())
}
