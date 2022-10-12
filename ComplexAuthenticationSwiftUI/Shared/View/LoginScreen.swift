//
//  HomeScreen.swift
//  ComplexAuthenticationSwiftUI
//
//  Created by Waqas Khadim on 03/10/2022.
//

import SwiftUI

struct HomeScreen: View {
    @State private var userName : String = ""
    @State private var password : String = ""
    @State private var circleheight : CGFloat = 0
    var body: some View {
        
        VStack {
        
            GeometryReader {
                proxy -> AnyView in

                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if circleheight == 0 {
                        circleheight = height
                    }
                }

                return AnyView(
                    ZStack{

                        Circle()
                            .fill(.black)
                            .offset(x: getRect().width / 2, y: -height/1.3)

                        Circle()
                            .fill(.black)
                            .offset(x: -getRect().width / 2, y: -height/1.5)

                        Circle()
                            .fill(.red)
                            .offset(y: -height/1.3)
                            .rotationEffect(.init(degrees: -5))



                    }
                    
                        
                )
                
            }.frame(maxHeight: getRect().width)
            
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
                
                Button(action: {}, label: {
                    Text("Forgot Password?")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                })
                .frame( maxWidth: .infinity,  alignment: .trailing)
                .padding(.top, 15)
                
                // next button
                
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
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding(.top, 10)
                
                // adding space
                Spacer()
                HStack(alignment: .center){
                    Text("You don't have an account?")
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                    Text("Signup")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                
            }.padding()
            // remove unwanted space
                .padding(.top, -circleheight / 1.5)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

 
// extension to get screen height

extension View {
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
