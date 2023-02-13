//
//  Login.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import SwiftUI

let Helper = CommonHelper();

struct Login: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack() {
                Text(Helper.greetings())
                TextField("Username", text: $username)
                    .frame(height: 48.0)
                    .padding(.horizontal, 8)
                    .background(Color(hue: 0.0, saturation: 0.0, brightness: 0.844, opacity: 0.93))
                SecureField("Password", text: $password)
                    .frame(height: 48.0)
                    .padding(.horizontal, 8)
                    .background(Color(hue: 0.0, saturation: 0.0, brightness: 0.844, opacity: 0.93))
                
                Button(action: {
                    isClicked = true
                }){
                    Text("Signin")
                }
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding(10)
                .background(Color.blue)
                .cornerRadius(4)
                .disabled(true)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            .background(Color.white)
            .foregroundColor(Color.black)
            .navigationDestination(isPresented: $isClicked) {
                Dashboard()
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        let iPhone14: String = "iPhone 14 Pro Max"
        
        Login()
            .previewDevice(PreviewDevice(rawValue: iPhone14))
    }
}
