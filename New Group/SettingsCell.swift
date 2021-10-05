//
//  SettingsCell.swift
//  Beaty
//
//  Created by Марина Михайлова on 07.02.2021.
//

import SwiftUI

struct SettingsCell: View {
    var title : String
    var imgName : String
    var clr : Color
    var body: some View {
        HStack {
            Image(systemName: imgName)
                .font(.headline)
                .foregroundColor(clr)
            
            Text(title)
               // .font(.headline)
                .foregroundColor(Color(.systemGray))
                
                .font(.system(size:17, weight: .light))
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}


