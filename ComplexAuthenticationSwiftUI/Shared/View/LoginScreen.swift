//
//  HomeScreen.swift
//  ComplexAuthenticationSwiftUI
//
//  Created by Waqas Khadim on 03/10/2022.
//

import SwiftUI

struct LoginScreen: View {
    @State private var userName : String = ""
    @State private var password : String = ""
    @State private var circleheight : CGFloat = 0
    var function: () -> Void
    var body: some View {
        
        VStack{
            // title
            Text("Sign In")
                .font(.title)
                .fontWeight(.bold)
                .kerning(1.9)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // username title
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("User Name")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                // text field
                
                TextField("Waqas.khadim@invozone.com", text: $userName)
                
                // Divider
                Divider()
            })
            .padding(.top, 25)
            
            // password field here
            
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
            
            
            // forgot password button
            
            Button(action: function, label: {
                Text("Forgot Password?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            })
            .frame( maxWidth: .infinity,  alignment: .trailing)
            .padding(.top, 15)
            
            // next button
            
            NavigationLink(destination: {
                Home()
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                // adding shodow
                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
            })
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(.top, 10)
            
            
            
            
        }.padding()
    }
}



 
