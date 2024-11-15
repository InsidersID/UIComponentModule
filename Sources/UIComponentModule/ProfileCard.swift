import SwiftUI

public struct ProfileCard: View {
    public var name: String
    public var imageData: Data
    public var isAddProfile: Bool
    public var isCompleted: Bool
    
    public init(name: String, isAddProfile: Bool = false, isCompleted: Bool = false, imageData: Data = Data()) {
        self.name = name
        self.imageData = imageData
        self.isAddProfile = isAddProfile
        self.isCompleted = isCompleted
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let photoSize = width * 0.85
            
            CardContainer(cornerRadius: 24) {
                VStack(alignment: .center) {
                    VStack {
                        if isAddProfile {
                            ZStack {
                                Color("secondary4", bundle: .main)
                                    .frame(width: photoSize, height: photoSize)
                                    .cornerRadius(24)
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: photoSize * 0.4, height: photoSize * 0.4)
                                    .foregroundStyle(Color("white", bundle: .main))
                            }
                        } else {
                            if let image = UIImage(data: imageData) {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: photoSize, height: photoSize)
                                    .cornerRadius(24)
                            } else {
                                Image("")
                                    .resizable()
                                    .frame(width: photoSize, height: photoSize)
                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    .cornerRadius(24)
                            }
                        }
                    }

                    Spacer()
                    
                    HStack {
                        Text(name)
                            .foregroundStyle(Color("blackOpacity4", bundle: .main))
                            .multilineTextAlignment(.leading)
                            .font(.custom("Inter-SemiBold", size: 16))
                        
                        Spacer()
                        
                        if !isCompleted && !isAddProfile {
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundColor(Color("danger5", bundle: .main))
                        }
                    }
                }
            }
            .frame(width: width, height: height, alignment: .center)
        }
        .aspectRatio(170.5/198, contentMode: .fit)
    }
}

#Preview {
    ZStack(alignment: .center) {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible())], spacing: 20){
            ProfileCard(name: "Iqbal Setiawan")
            ProfileCard(name: "Iqbal Setiawan")
            ProfileCard(name: "Iqbal Setiawan", isAddProfile: true)
        }
        .padding()
    }
}
