//
//  SelectedMasters.swift
//  Beaty
//
//  Created by Марина Михайлова on 18.01.2021.
//

import SwiftUI

struct SelectedMasters: View {
    
    @State var index = 3
    var body: some View {
        HStack(alignment: .top) {
     
        Button(action: {
            self.index = 3
        }, label: {
           
   Text("Наші фото")
    .foregroundColor(self.index == 3 ? Color.white : Color(.systemGray3))
         })

        .frame(width: (UIScreen.main.bounds.width / 2), height: (UIScreen.main.bounds.height / 14))
        .background(Color("Color").opacity(self.index == 3 ? 1 : 0))
  
            Button(action: {
                self.index = 4
            }, label: {
              Text("Тренери")
        .foregroundColor(self.index == 4 ? Color.white : Color(.systemGray3))
            })
       .frame(width: (UIScreen.main.bounds.width / 2), height: (UIScreen.main.bounds.height / 14))
          .background(Color("Color").opacity(self.index == 4 ? 1 : 0))
      
        }
        .background(Color("Color-2"))
        .frame(width: (UIScreen.main.bounds.width), height: (UIScreen.main.bounds.height / 14))
        .cornerRadius(15)
       
        .padding(.top, 100)
        Spacer()
        
//
        
        GeometryReader{_ in
                   VStack{
                       if self.index == 3{
                           
                           AlotImage()
                       }
                       else if self.index == 4{
                   
                        Personal()
                       }
                   
                   }
               }
      
    }
}

struct SelectedMasters_Previews: PreviewProvider {
    static var previews: some View {
        SelectedMasters()
    }
}
