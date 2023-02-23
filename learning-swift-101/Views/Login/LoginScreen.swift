//
//  LoginScreen.swift
//  learning-swift-101
//
//  Created by Rhen Mark on 24/2/23.
//

import SwiftUI

struct LoginScreen: View {
    @State var isLoginClicked = false
    
    func setIsLogin() {
        self.isLoginClicked = true
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button(action: {
                        setIsLogin()
                    }) {
                        Text("Log In")
                            .font(.system(size: 24))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(16)
                    
                    Spacer()
                        .frame(width: 16)
                    Button(action: {
                        setIsLogin()
                    }) {
                        Label("", systemImage: "faceid")
                            .labelStyle(IconOnlyLabelStyle())
                            .font(.system(size: 32))
                            .frame(height: 40)
                            .padding()
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(16)
                    }
                }
                .padding()
                .padding(.bottom, -12)
                
                HStack {
                    Button(action: {}) {
                        Text("Become a client")
                            .font(.system(size: 24))
                    }
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .cornerRadius(16)
                    .shadow(radius: 5)
                }
                .padding(.top, 0)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(Color("primary"))
            .navigationDestination(isPresented: $isLoginClicked) {
                Login()
            }
        }
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
