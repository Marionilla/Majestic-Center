//
//  NewView.swift
//  Beaty
//
//  Created by Марина Михайлова on 08.02.2021.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI
struct NewView: View {
  
    @Binding var isPresented: Bool

    @ObservedObject var categories = getThirdblock()
    var body: some View {
        VStack{
        VStack {
            if self.categories.datas.count != 0 {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(self.categories.datas) { i in
                            VStack{
                                AnimatedImage(url: URL(string:i.pic))
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFill()
                                    .cornerRadius(55)
                                    .frame(width: (UIScreen.main.bounds.width))
                                   
                                HStack {
                                    VStack {
                                        Text(i.name)
                                            .foregroundColor(Color.black)
                                            .font(.system(size:17, weight: .light))
                                            .multilineTextAlignment(.center)
                                            .padding()
                                        Text(i.detail)
                                            .font(.system(size:15, weight: .light))
                                            .multilineTextAlignment(.leading)
                                            .padding()
                                        Text(i.drop)
                                            .multilineTextAlignment(.center)
                                            .font(.system(size:15, weight: .light))
                                            .padding(.bottom)
                                           
                                    }
                                  
                                    .foregroundColor(Color(.systemGray))
                                    .lineSpacing(5)
          
                            }
                   
                        }
                
                    }
                    
                        .background(Color(.systemGray5))
                        .cornerRadius(55)
                        .padding(.bottom)
                        .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
                        
                    }
                  //  .padding(.bottom, 20)
            }
        
            }
           
        }
      
        VStack{
            Button(action: {isPresented.toggle()}, label: {
                Text("Закрити")
                    .foregroundColor(Color(.systemGray))
                    .font(.system(size:22, weight: .light))
                    .frame(width: (UIScreen.main.bounds.width - 100), height: 50)
                    .background(Color(.systemGray5))
                   
                    .cornerRadius(25)
         
            })
            .shadow(color: Color(.systemGray), radius: 5,x: 5.0, y: 5.0)
        }
            .padding()
        .padding(.bottom)
    }
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    .preferredColorScheme(.light)
    }
}

class getThirdblock: ObservableObject {
    @Published var datas = [newInfo]()
    init() {
        let db = Firestore.firestore()
        db.collection("newInfo").addSnapshotListener { (snap, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                let id = i.document.documentID
                let name = i.document.get("name") as! String
                let detail = i.document.get("detail") as! String
                let pic = i.document.get("pic") as! String
                let drop = i.document.get("drop") as! String
                self.datas.append(newInfo(id: id, name: name, detail: detail, pic: pic, drop: drop))
            }
        
        }
    }
}
struct newInfo: Identifiable {
    var id: String
    var name: String
    var detail: String
    var pic: String
    var drop: String
}

