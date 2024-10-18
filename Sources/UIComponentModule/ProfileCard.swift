import SwiftUI

public struct ProfileCard: View {
    var width: CGFloat = 170.5
    var height: CGFloat = 224
    var photoWidth: CGFloat = 146.5
    var photoHeight: CGFloat = 140
    var name: String = "Iqbal Setiawan"
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: width, height: height)
                .foregroundStyle(.white)
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
    ProfileCard()
        .background(Color.gray.ignoresSafeArea())
}
