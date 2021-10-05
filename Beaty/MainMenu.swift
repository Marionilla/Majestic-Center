//
//  MainMenu.swift
//  Beaty
//
//  Created by Марина Михайлова on 17.01.2021.
//

import SwiftUI

struct MainMenu: View {
  
    var body: some View {
        
        DownTabBar()
}
}



struct DownTabBar: View {
    @State var index = 0
    
    var body: some View {
        
        VStack(alignment: .center){
     GeometryReader{_ in
         HStack {
                    Spacer()
                    VStack {
                        HStack{
                    Text("З любов'ю")
                        .foregroundColor(.white)
                        .padding()
                        }
                        .padding()
                        .padding(.top)
                        HStack{
                            Image(systemName: "suit.heart")
                                .foregroundColor(.white)
                        }
                    }
                    .font(.system(size:17, weight: .light))
                    Spacer()
                }
                VStack{
                    if self.index == 0{
                        
                        HomePage()
                    }
                    else if self.index == 1{
                       
                        SelectedMasters()
                    }
                
                    else{
                        
                        SettingsTab()
                    }
                }
            }
            .padding(.bottom, 10)
            .background(Color("Color-1").cornerRadius(35))
            .padding(.bottom,15)
            .background(Color("Color").cornerRadius(35))
            .shadow(radius: 5)

            Spacer()
                // Нижний таббар
            HStack(alignment: .bottom) {
           
            Button(action: {
                self.index = 0
            }) {
                VStack{
                  
                Image(systemName: "house.fill")
                    .resizable()
                    .foregroundColor(self.index == 0 ? Color.white : Color(.systemGray3))
                    .scaledToFit()
                    .padding()
                    .shadow(radius: 5)
                }
                .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.height / 14))
            }
            .background(Color("Color").opacity(self.index == 0 ? 1 : 0))
            .clipShape(Circle())
            .padding(.leading,10)
            
            //
            Button(action: {
                self.index = 1
            }) {
                VStack {
                Image(systemName: "person.3.fill")
                    .resizable()
                    .foregroundColor(self.index == 1 ? Color.white : Color(.systemGray3))
                  
                    .scaledToFit()
                    .padding()
                    .shadow(radius: 5)
                }
                .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.height / 14))
            }
            .background(Color("Color").opacity(self.index == 1 ? 1 : 0))
            .clipShape(Circle())
            
                
            //
            Button(action: {
                self.index = 2
        }) {
                VStack {
                Image(systemName: "envelope.fill")
                    .resizable()
                    .foregroundColor(self.index == 2 ? Color.white : Color(.systemGray3))
                .scaledToFit()
                    .padding()
                    .shadow(radius: 5)
                }
                .frame(width: (UIScreen.main.bounds.width / 3), height: (UIScreen.main.bounds.height / 14))
        }
            .background(Color("Color").opacity(self.index == 2 ? 1 : 0))
            .clipShape(Circle())
                 .padding(.trailing,10)
           
            }
            .padding(.bottom, 10)
            .padding(.top,3)
            .background(Color("Color-1"))
           
        }
        .background(Color(.systemGray5))
        .frame(width: (UIScreen.main.bounds.width))
      
        .edgesIgnoringSafeArea(.all)
      
    }
}
