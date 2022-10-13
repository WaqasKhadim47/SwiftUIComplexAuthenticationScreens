//
//  HomeScreen.swift
//  ComplexAuthenticationSwiftUI
//
//  Created by Waqas Khadim on 12/10/2022.
//

import SwiftUI

struct HomeScreen: View {
    @State var showLogin = 0
    @State private var circleheight : CGFloat = 0
    var body: some View {
        
       
        NavigationView {
            VStack {
                
                    GeometryReader {
                        proxy -> AnyView in

                        let height = proxy.frame(in: .global).height
                        DispatchQueue.main.async {
                            if circleheight == 0 {
                                circleheight = height
                            }
                        }

                      return  AnyView(
                            ZStack{

                                Circle()
                                    .fill(.black)
                                    .offset(x: getRect().width / 2, y: -height/1.1)
                                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)

                                Circle()
                                    .fill(.black)
                                    .offset(x: -getRect().width / 2, y: -height/1.2)
                                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)

                                Circle()
                                    .fill(.red)
                                    .offset(y: -height/1.1)
                                    .rotationEffect(.init(degrees: -5))
                                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
                            }
                            
                        )
                        
                    }.frame(maxHeight: getRect().width)
                    
                    ZStack{
                        
                        if showLogin == 0 {
                            LoginScreen(function: {
                                withAnimation{
                                    showLogin = 2
                                }
                            })
                                .transition(.move(edge: .trailing))
                        }
                        else if showLogin == 1 {
                            SignupScreen()
                                .transition(.move(edge: .leading))
                        } else {
                            ForgotPassword(backButton: {
                                withAnimation{
                                    showLogin = 0
                                }
                            })
                                .transition(.move(edge: .leading))
                        }
                        
                    }
                    // remove unwanted space
                        .padding(.top, -circleheight / 1.5)
                        .frame(maxHeight: .infinity, alignment: .top)
                }.overlay(
                    ZStack{
                        if showLogin == 0 {
                            HStack(){
                                Text("You don't have an account?"  )
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Button(action: {
                                    withAnimation{
                                        showLogin = 1
                                    }
                                    
                                }, label: {
                                    Text("Signup")
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                })
                            }
                        } else if showLogin == 1 {
                            HStack(){
                                Text("Already have an account?" )
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                Button(action: {
                                    withAnimation{
                                        showLogin = 0
                                    }
                                    
                                }, label: {
                                    Text("Sign in")
                                        .fontWeight(.bold)
                                        .foregroundColor(.red)
                                })
                            }

                        }
                    },alignment: .bottom
                ).background(
                
                        HStack{
                            Circle()
                                .fill(.black)
                                .frame(width: 70, height: 70)
                                .offset(x: -25)
                                .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
                            
                            Spacer(minLength: 0)
                            
                           
                                Circle()
                                    .fill(.red)
                                    .frame(width: 120, height: 120)
                                    .offset(x: 45, y: 0)
                                    .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
                                
                        }.offset(y: getSafeArea().bottom + 30)
                        ,alignment: .bottom
            )
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

 extension View {
    
    func getSafeArea() ->  EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}

