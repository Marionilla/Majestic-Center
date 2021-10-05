//
//  Personal.swift
//  Beaty
//
//  Created by Марина Михайлова on 12.02.2021.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct Personal: View {
    var body: some View {
      
        VStack {
          DetailPersona()
   
        }
        .background(Color(.systemGray5).cornerRadius(35))
        .padding(.bottom, 5)
       // }
   
        .cornerRadius(35)
    }
}

struct DetailPersona: View {
    @ObservedObject var categories = getDetailPersona()
    var body: some View {
    
        if self.categories.datas.count != 0 {
          ScrollView(.vertical, showsIndicators: false) {
               VStack {
                    ForEach(self.categories.datas) { i in
         
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
                                HStack{
                            AnimatedImage(url: URL(string:i.pic))
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFill()
                         
                                }
                                .frame(width: (UIScreen.main.bounds.width / 2))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 10)
                                .padding()
                              VStack(alignment: .center){
                         Spacer()
                                    Text(i.name)
                                      
                                        .foregroundColor(Color(.systemGray))
                                        .font(.system(size: 25, weight: .light))
                                       
                              Spacer()
                            }
                        //    .padding()
                            }
                         ScrollView(.vertical, showsIndicators: true){
                         VStack{
                 
                                   Text(i.details)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(.systemGray))
                                        .font(.system(size:17, weight: .light))
                       
                            }
                                        .padding()
                         }
                         .padding(.bottom)
                
                            }
                        .padding()
          //    Divider()
                    }
                    .background(Color(.systemGray5))
                    .cornerRadius(55)
                    .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
                    .padding(.bottom)
                
          }
          .padding(.vertical)
          }
        }
    }
}


class getDetailPersona: ObservableObject {
    @Published var datas = [information]()
    init() {
        let db = Firestore.firestore()
        db.collection("personal").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let details = i.document.get("details") as! String
                let pic = i.document.get("pic") as! String
          
               self.datas.append(information(id: id, name: name, details: details, pic: pic))
            }
        
        }
    }
}
struct information: Identifiable {
    var id: String
    var name: String
    var details: String
    var pic: String

}

