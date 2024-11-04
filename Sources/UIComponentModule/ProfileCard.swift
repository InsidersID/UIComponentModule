import SwiftUI

public struct ProfileCard: View {
    public var width: CGFloat
    public var height: CGFloat
    public var photoWidth: CGFloat
    public var photoHeight: CGFloat
    public var name: String
    public var isAddProfile: Bool
    public var isCompleted: Bool
    
    public init(width: CGFloat = 170.5, height: CGFloat = 224, photoWidth: CGFloat = .infinity, photoHeight: CGFloat = 140, name: String, isAddProfile: Bool, isCompleted: Bool = false) {
        self.width = width
        self.height = height
        self.photoWidth = photoWidth
        self.photoHeight = photoHeight
        self.name = name
        self.isAddProfile = isAddProfile
        self.isCompleted = isCompleted
    }
    
    public var body: some View {
        CardContainer(cornerRadius: 24) {
            VStack {
                if isAddProfile {
                    ZStack {
                        Color.blue.opacity(0.3)
                            .frame(width: photoWidth)
                            .aspectRatio(1, contentMode: .fit)
                            .cornerRadius(24)
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 68.5, height: 68.5)
                            .foregroundStyle(.white)
                    }
                } else {
                    Image("")
                        .resizable()
                        .frame(width: photoWidth)
                        .background(.gray)
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(24)
                }
                
                Spacer()
                
                HStack {
                    Text(name)
                        .font(.system(.title2, design: .serif, weight: .bold))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    ProfileCard(name: "Iqbal", isAddProfile: false)
}
