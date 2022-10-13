//
//  SignupScreen.swift
//  ComplexAuthenticationSwiftUI
//
//  Created by Waqas Khadim on 11/10/2022.
//

import SwiftUI

struct SignupScreen: View {
    @State private var userName : String = ""
    @State private var password : String = ""
    @State private var fullname : String = ""
    @State private var circleheight : CGFloat = 0
    var body: some View {
        VStack{
            // title
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
                .kerning(1.9)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // username title
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Full name")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                   
                
                TextField("Waqas Khadim", text: $fullname)
                
                Divider()
            }).padding(.top, 25)
            
            // user name
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Username")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("Username", text: $userName)
                
                Divider()
            }).padding(.top, 25)
            
            // password
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Password")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                // text field
                
                SecureField("*******", text: $password)
                
                // Divider
                Divider()
            })
            .padding(.top, 25)
            
            
            NavigationLink(destination: {
                Home()
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
            }).frame(maxWidth:.infinity, alignment: .leading)
                .padding(.top, 10)
           
            
                                
        }.padding()
    }
}


