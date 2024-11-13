import SwiftUI

public struct ProfileCard: View {
    public var width: CGFloat
    public var height: CGFloat
    public var photoWidth: CGFloat
    public var photoHeight: CGFloat
    public var name: String
    public var imageData: Data
    public var isAddProfile: Bool
    public var isCompleted: Bool
    
    public init(width: CGFloat = 170.6, height: CGFloat = 198, photoWidth: CGFloat = 146.5, photoHeight: CGFloat = 140, name: String, isAddProfile: Bool = false, isCompleted: Bool = false, imageData: Data = Data()) {
        self.width = width
        self.height = height
        self.photoWidth = photoWidth
        self.photoHeight = photoHeight
        self.name = name
        self.imageData = imageData
        self.isAddProfile = isAddProfile
        self.isCompleted = isCompleted
    }
    
    public var body: some View {
        CardContainer(cornerRadius: 24) {
            VStack {
                VStack {
                    if isAddProfile {
                        ZStack {
                            Color(red: 0.4, green: 0.83, blue: 0.91)
                                .frame(width: photoWidth, height: photoHeight)
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(24)
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 68.5, height: 68.5)
                                .foregroundStyle(.white)
                        }
                    } else {
                        if let image = UIImage(data: imageData) {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: photoWidth, height: photoHeight)
                                .cornerRadius(24)
                        } else {
                            Image("")
                                .resizable()
                                .frame(width: photoWidth, height: photoHeight)
                                .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                .cornerRadius(24)
                        }
                        
                    }
                }
                .padding(.bottom)
                
                HStack {
                    Text(name)
                        .font(Font.custom("Inter-SemiBold", size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(red: 0.04, green: 0.04, blue: 0.04).opacity(0.75))
                        .multilineTextAlignment(.leading)
                    
//                    Spacer()
                    
                    if isCompleted == false && isAddProfile == false {
                        Image(systemName: "exclamationmark.circle.fill")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16){
        ProfileCard(name: "Iqbal Setiawan")
        ProfileCard(name: "Iqbal Setiawan")
    }
}
