//
//  Login.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import SwiftUI


struct Welcome: View {
    
    let Helper = CommonHelper();
    let dummyImage = "https://i.pravatar.cc/200?img=6"

    @State var isClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                VStack {
                    AsyncImage(url: URL(string: dummyImage))
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    Spacer()
                        .frame(height: 24)
                    Text("Welcome back,")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 24)
                    Text("John Doe")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                Button {
                    self.isClicked = true
                } label: {
                    Label("", systemImage: "arrow.forward.circle")
                        .font(.system(size: 32))
                }
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .frame(height: 60)
                .padding()
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("primary"))
            .navigationDestination(isPresented: $isClicked) {
                Dashboard()
            }
            .navigationBarBackButtonHidden()

        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        let iPhone14: String = "iPhone 14 Pro Max"
        
        Welcome()
            .previewDevice(PreviewDevice(rawValue: iPhone14))
    }
}
