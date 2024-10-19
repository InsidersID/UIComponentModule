import SwiftUI

public struct ProfileCard: View {
    public var width: CGFloat = 170.5
    public var height: CGFloat = 224
    public var photoWidth: CGFloat = .infinity
    public var photoHeight: CGFloat = 140
    public var name: String
    public var isAddProfile: Bool
    public var isCompleted: Bool = false
    
    public init(name: String, isAddProfile: Bool) {
        self.name = name
        self.isAddProfile = isAddProfile
    }
    
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .frame(width: width, height: height)
                .foregroundStyle(.white)
                .shadow(color: .black.opacity(0.1), radius: 10)
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
            .padding()
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    ProfileCard(name: "Iqbal", isAddProfile: false)
        .background(Color.gray.ignoresSafeArea())
}
