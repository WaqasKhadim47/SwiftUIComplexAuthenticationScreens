//
//  Home.swift
//  ComplexAuthenticationSwiftUI
//
//  Created by Waqas Khadim on 12/10/2022.
//

import SwiftUI

struct Home: View {
    private var categories = ["Today", "Latest News", "Sport", "Showbiz", "Market"]
    @State private var selectedIndex = 0
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
        VStack(alignment: .leading){
            HStack {
                VStack(alignment: .leading, spacing: 0, content:  {
                    Text("Hello, Waqas")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                        .kerning(0.4)
                        .frame(width: .infinity, alignment: .leading)
                        
                   
                    
                    Text("Good Morning!")
                        .font(.system(size: 30))
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .kerning(0.4)
                        
                    
                }).padding()
                   
                
                Spacer()
               
                Button(action: {}, label: {
                    Image(systemName: "person")
                         .font(.system(size: 24, weight: .bold))
                         .foregroundColor(.white)
                         .padding()
                         .background(.black)
                         .clipShape(Capsule())
                         .shadow(color: .blue.opacity(0.5), radius: 5, x: 0, y: 0)
                }).frame(alignment: .trailing)
                    .padding()
                
            }.frame(maxWidth: getRect().width)
                .padding(.top, 40)
            
            // add banner in this
            
            Rectangle()
                .padding()
                .background(.white)
                .frame(width: getRect().width, height: 250, alignment: .center)
               
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< categories.count) { i in
                        Button(action: {
                            
                            withAnimation{
                                
                                selectedIndex = i
                            }
                        }) {
                            CategoryView(isActive: selectedIndex == i, text: categories[i])
                        }
                    }
                }
                .padding()
            }
            
            // bottom view here
            
            if selectedIndex == 0 {
                BottomList()
                    .transition(.move(edge: .trailing))
            } else if selectedIndex == 1 {
                BottomList()
                    .transition(.move(edge: .leading))
            }else if selectedIndex == 2 {
                BottomList()
                    .transition(.move(edge: .trailing))
            }else if selectedIndex == 3 {
                BottomList()
                    .transition(.move(edge: .leading))
            }else if selectedIndex == 4 {
                BottomList()
                    .transition(.move(edge: .trailing))
            }else {
                // nothing
            }
            
           
        
            
           
            
        }.frame(maxHeight: getRect().height)
        .padding(.top, 20)
        .ignoresSafeArea()
            
            Spacer()
    }.navigationBarBackButtonHidden(true)
            
    }}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? .red : Color.black.opacity(0.5))
            // underline
            if (isActive) { Color(.gray)
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct BottomList: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ForEach(0 ..< 100){
                    i in HStack{
                        Image("placeholder")
                            .resizable()
                            .frame(width: 120, height: 80, alignment: .center)
                            .padding()
                        
                        //
                        Text("I hope you like my design. Please check more")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .fontWeight(.regular)
                            .kerning(0.4)
                            .padding()
                        
                        
                    }.frame(height: 100, alignment: .leading)
                }
            }
        }
    }
}
