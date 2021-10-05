//
//  HomePage.swift
//  Beaty
//
//  Created by Марина Михайлова on 18.01.2021.
//

import SwiftUI

struct HomePage: View {
   
    var body: some View {
         ScrollView(.vertical, showsIndicators: true){
        ImgBlock()
            VStack {
                SecondBlock()
                ThirdBlock()
                FouthBlock()
            }
            .background(Color(.systemGray5).cornerRadius(35))
            .padding(.bottom, 5)
        }
         .cornerRadius(35)
         .preferredColorScheme(.light)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
struct ImgBlock: View {
    var body: some View {
        
        HStack(alignment: .center){
            Image("1")
                .renderingMode(.original)
                .resizable()
               .scaledToFill()
        }
  .frame(width: (UIScreen.main.bounds.width - 50))
        .padding(.bottom)
        .padding(.top, 40)
      

    }
}
struct SecondBlock: View {
    @State var isShowing = false

    var body: some View {
            VStack {
                HStack(alignment: .top){
                Text("Ласкаво просимо")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(size:19, weight: .light))
                    .padding()
                    Spacer()
            }
                .padding(.leading)
                Button(action: {isShowing.toggle()}, label: {
                Text("Наші НОВИНИ")
                    .foregroundColor(Color.white)
                    .font(.system(size:17, weight: .light))
                    .padding()
                    .background(Color("Color-1"))
                    .cornerRadius(15)
                    .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
           
            })
           .padding(.bottom)
                HStack {
                    Text("Про наш центр \"Majestic\"")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size:17, weight: .light))
                        .padding()
                    Spacer()
                }
                .padding(.leading)
                .fullScreenCover(isPresented: $isShowing) {
                    NewView(isPresented: $isShowing)
                }
        }
    }
}
struct ThirdBlock: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "phone")
        .foregroundColor(.white)
           .padding()
                VStack(alignment: .leading) {
                    Text("Зателефонуйте нам")
             .foregroundColor(Color(.systemGray5))
                        .font(.system(size:17, weight: .light))
        Text("+380638966490 ; +380930179629")
        .foregroundColor(Color.white)
                }
                Spacer()
            }
            Divider()
            HStack{
                Image(systemName: "pin")
                    .foregroundColor(.white)
                    .padding()
                VStack(alignment: .leading) {
                    Text("Знайдіть нас")
                        .foregroundColor(Color(.systemGray5))
                        .font(.system(size:17, weight: .light))
                    Text("Вінниця. Д. Нечая 11")
                        .foregroundColor(Color.white)
                }
                Spacer()
            }
            Divider()
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.white)
                    .padding()
                VStack(alignment: .leading) {
                    Text("Напишіть нам")
                        .foregroundColor(Color(.systemGray5))
                        .font(.system(size:17, weight: .light))
                    Text("aerialist.book@gmail.com")
                        .foregroundColor(Color.white)
                }
                Spacer()
            }
        }
        .padding()
        .background(Color("Color-2"))
        .cornerRadius(15)
        .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
        .padding([.bottom,.leading,.trailing])
  
    }
}
struct FouthBlock: View {
    @State var isShow = false
    var body: some View {
      LazyVStack(alignment: .leading){
            HStack{
                Spacer()
                Text("Графік роботи")
                Spacer()
            }
            .font(.system(size:21, weight: .light))
            .padding()
        //
        Section {
            HStack{
                VStack(alignment: .center) {
                Text("П\n о\n н\n е\n д\n і\n л\n о\n к")
                }
               .padding()

                Divider()
  
                VStack {
                    VStack {
                         Text("1 група \"Born to fly\"")
                        Text("14.00 - 15.00")
                    }
                    Divider()
                    VStack{
                         Text("2 група \"Aerialist\"")
                        Text("15.00 - 16.30")
                    }
                    Divider()
                    VStack{
                            Text("3 група \"Upside down\"")
                        Text("16.30 - 18.00")
                    }
                    Divider()
                    VStack{
                            Text("4 група \"The best\"")
                    Text("18.00 - 19.00")
                    }
                    Divider()
                    VStack{
                            Text("5 група \"Role up\"")
                    Text("19.00 - 20.30")
                    }
                }
   
             
       
            }
            .padding()
        }
        .background(Color(.systemGray5))
        .cornerRadius(15)
        //
        Section {
            HStack{
                VStack(alignment: .center) {
                Text("В\nі\nв\nт\nо\nр\nо\nк")
        
                }
                .padding()
                Divider()
       
                VStack{
                    VStack{
                            Text("\"Baby acro yoga\"")
                    Text("16.00 - 17.00")
                    }
                    Divider()
                    VStack{
                            Text("\"Dance classe\"")
                    Text("17.00 - 19.00")
                    }
                    Divider()
                    VStack{
                            Text("\"Experimental\"")
                    Text("19.00 - 20.30")
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGray5))
        .cornerRadius(15)
        //
        Section {
            HStack{
                VStack(alignment: .center) {
                Text("С\nе\nр\nе\nд\nа")
                }
                .padding()
                Divider()
    
                VStack{
                    VStack{
                            Text("2 група \"Aerialist\"")
                    Text("15.00 - 16.30")
                    }
                    Divider()
                    VStack{
                            Text("3 група \"Upside down\"")
                    Text("16.30 - 18.00")
                    }
                    Divider()
                    VStack{
                            Text("4 група \"The best\"")
                    Text("18.00 - 19.00")
                    }
                    Divider()
                    VStack{
                            Text("5 група \"Role up\"")
                    Text("19.00 - 20.30")
                    }
                }

            }
            .padding()
        }
        .background(Color(.systemGray5))
        .cornerRadius(15)
        //
        Section {
            HStack{
                VStack(alignment: .center) {
                Text("Ч\nе\nт\nв\nе\nр")
                }
                .padding()
                Divider()

                VStack{
                    VStack{
                             Text("1 група \"Born to fly\"")
                    Text("15.00 - 16.30")
                    }
                    Divider()
                    VStack{
                            Text("\"Baby acro yoga\"")
                    Text("16.30 - 17.30")
                    }
                    Divider()
                    VStack{
                            Text("\"Dance classes\"")
                    Text("17.30 - 19.00")
                    }
                    Divider()
                    VStack{
                            Text("\"Stretching 18+\"")
                    Text("19.00 - 20.30")
                    }
                }
     
     
            }
            .padding()
        }
        .background(Color(.systemGray5))
        .cornerRadius(15)
        //
        Section {
            HStack{
                VStack(alignment: .center) {
                    Text("П\n’\nя\nт\nн\nи\nц\nя")
                }
                .padding()
                Divider()
    
                VStack{
                    VStack{
                            Text("1 група \"Born to fly\"")
                    Text("15.00 - 16.00")
                    }
                    Divider()
                    VStack{
                            Text("2 група \"Aerialist\"")
                    Text("16.00 - 17.00")
                    }
                    Divider()
                    VStack{
                            Text("3 група \"Upside down\"")
                    Text("17.00 - 18.00")
                    }
                    Divider()
                    VStack{
                            Text("4 група \"The best\"")
                    Text("18.00 - 19.00")
                    }
                                Divider()
                    VStack{
                            Text("5 група \"Role up\"")
                    Text("19.00 - 20.00")
                    }
                }
          
            }
            .padding()
        }
        .background(Color(.systemGray5))
        .cornerRadius(15)

        }
        .font(.system(size:15, weight: .light))
        .foregroundColor(Color(.systemGray))
        .multilineTextAlignment(.center)
        .padding()
        .background(Color(.systemGray6).cornerRadius(15))
        .padding()
        .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
        
        HStack(alignment: .center) {
            Button(action: {isShow.toggle()}, label: {
     
                Text("Наш магазин")
                    .font(.system(size:17, weight: .light))
                        .foregroundColor(Color.white)
                    .padding()
                        .background(Color("Color-2"))
                        .cornerRadius(15)
                    .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)

                    .padding(.bottom, 20)
                .padding()
    
            })
            .fullScreenCover(isPresented: $isShow) {
                StoreMag(isPresented: $isShow)
            }
        }
    }
}
