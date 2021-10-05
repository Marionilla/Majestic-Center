//
//  AlotImage.swift
//  Beaty
//
//  Created by Марина Михайлова on 02.02.2021.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct AlotImage: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
        VStack {
        Home()
        }
        .background(Color(.systemGray5).cornerRadius(35))
        .padding(.bottom, 5)
        }
   
        .cornerRadius(35)
    }
}

struct Home: View {
    @ObservedObject var categories = getCategoriesData()
    var body: some View {
        VStack {
    
            if self.categories.datas.count != 0 {
             VStack {
                        ForEach(self.categories.datas) { i in
                      ZStack{
                        VStack{
                                AnimatedImage(url: URL(string:i.pic)!)
                                    .renderingMode(.original)
                                    .resizable()
                                  // .scaledToFill()
                                    .scaledToFit()
                        }
                     //   .background(Color("Color-4"))
                        .background(Color(.systemGray3))
                        .cornerRadius(55)
                        VStack {
                           Spacer()
                            //  HStack(alignment: .bottom) {
                        VStack{
                                        Text(i.name)
                                            .padding(.top)
                                            .font(.system(size:20, weight: .light))
                                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                        Text(i.price)
                                            .padding()
                                            .font(.system(size:17, weight: .light))
                                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                    }
                            .frame(width: (UIScreen.main.bounds.width - 50))
                      //  .background(Color("Color-1").opacity(0.5))
                        .background(Color(.systemGray).opacity(0.5))
                       
                                .cornerRadius(15)
                           // .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
                        .padding(.bottom)
                                }
                        .padding(.bottom)
                      }
                            .frame(width: (UIScreen.main.bounds.width), height: (UIScreen.main.bounds.height / 2))
                      //.background(Color("Color-3"))
                      .background(Color(.systemGray5))
                            .cornerRadius(55)
                      .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
                      
                            }
      
                }
             .padding(.vertical)
            }
        }
    }
}

class getCategoriesData: ObservableObject {
    @Published var datas = [category]()
    init() {
        let db = Firestore.firestore()
        db.collection("categories").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let price = i.document.get("price") as! String
                let pic = i.document.get("pic") as! String
                self.datas.append(category(id: id, name: name, price: price, pic: pic))
            }
        
        }
    }
}
struct category: Identifiable {
    var id: String
    var name: String
    var price: String
    var pic: String
}

