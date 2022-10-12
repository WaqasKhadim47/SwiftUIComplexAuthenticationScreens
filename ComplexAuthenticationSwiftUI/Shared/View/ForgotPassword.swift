//
//  ForgotPassword.swift
//  ComplexAuthenticationSwiftUI
//
//  Created by Waqas Khadim on 12/10/2022.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var userName : String = ""
    var backButton: () -> Void
    var body: some View {
        VStack{
            Button(action: backButton, label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .padding()
                    .background(.white)
                    .clipShape(Capsule())
                // adding shodow
                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
            })
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding(.bottom, 40)
            // title
            Text("Forgot Password")
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
            
            Button(action: {}, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .clipShape(Capsule())
                // adding shodow
                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
            })
            .frame(maxWidth:.infinity, alignment: .trailing)
            .padding(.top, 10)
        }.padding()
    }
}


