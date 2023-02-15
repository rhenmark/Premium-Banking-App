//
//  Login.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 12/2/23.
//

import SwiftUI

let Helper = CommonHelper();

let backgroundUi = LinearGradient(colors: [Color.white, Color.red], startPoint: .bottom, endPoint: .top)

struct Login: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isClicked: Bool = false
    
    private let loginTxt: String = "Login"
    private let signupTxt: String = "Signup"
    
    var body: some View {
        NavigationStack {
            VStack(){
                VStack() {
                    Text(Helper.greetings())
                    TextField("Username", text: $username)
//                        .frame(height: 48.0)
//                        .padding(.horizontal, 8)
                        .background(Color(hue: 0.0, saturation: 0.0, brightness: 0.844, opacity: 0.93))
                        .hidden()
                    SecureField("Password", text: $password)
//                        .frame(height: 48.0)
//                        .padding(.horizontal, 8)
                        .background(Color(hue: 0.0, saturation: 0.0, brightness: 0.844, opacity: 0.93))
                        .hidden()
                    
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
                    .disabled(self.isClicked)
                    
                    Button(action: {
                        isClicked = true
                    }){
                        Text(loginTxt)
                    }
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .padding(10)
                    .background(Color.black)
                    .cornerRadius(4)
                    .disabled(self.isClicked)
                    
                }
                .frame(alignment: .bottom)
                .padding(20)
                .foregroundColor(Color.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(backgroundUi)
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
