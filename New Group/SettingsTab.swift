//
//  SettingsTab.swift
//  Beaty
//
//  Created by Марина Михайлова on 07.02.2021.
//

import SwiftUI
import UIKit
import MessageUI

struct SettingsTab: View {
    @Environment(\.colorScheme) var colorScheme
@State private var name = ""
    @State private var showSheet = false
    @State var result: Result<MFMailComposeResult, Error>? = nil
    
    var body: some View {
        List {
            Section {
                Button(action: {self.showFeatures()}, label: {
                    SettingsCell(title: "Посилання на Instagram - тільки наш центр", imgName: "sparkles", clr: .black)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                })
            }
            //
            Section {
                Button(action: {self.writeReview()}, label: {
                    SettingsCell(title: "Посилання на Instagram - для навчання", imgName: "pencil", clr: .black)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                })
            }
                //
            Section {
                Button(action: {self.suggestFeature()}, label: {
                    SettingsCell(title: "Бронювання. Написати нам", imgName: "gift", clr: .black)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                })
            }

        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Settings")
        .background(Color(.systemGray5).cornerRadius(35))
     
        .sheet(isPresented: $showSheet) {
            MailView(result: self.$result, newSubject: "Бронювання", newMsgBody: "Ваше прізвище, ім'я - \n Ваш номер телефону - \n Ваш mail - \n Група до якої ходите (чи бажаєте ходити) - \n Ім'я тренера - \n \n \n \n Дякую, що заповнюєте всю інформацію ❤️ \n Хай щастить")
        }
        .environment(\.horizontalSizeClass, .regular)
        
        .cornerRadius(45)
    }
    func showFeatures() {
        let appURL = URL(string: "https://www.instagram.com/center_of_circus_arts_majestic/?hl=ru")!
        var componets = URLComponents(url: appURL, resolvingAgainstBaseURL: false)
        componets?.queryItems = [URLQueryItem(name: "action", value: "write")]
        
        guard let writeReviewURL = componets?.url else {return}
        UIApplication.shared.open(writeReviewURL)
    }
    func writeReview() {
        print("Go to App store")
        
        let appURL = URL(string: "https://www.instagram.com/world_of_aerial_gymnastics/?hl=ru")!
        var componets = URLComponents(url: appURL, resolvingAgainstBaseURL: false)
        componets?.queryItems = [URLQueryItem(name: "action", value: "write")]
        
        guard let writeReviewURL = componets?.url else {return}
        UIApplication.shared.open(writeReviewURL)
    }
  
    func suggestFeature() {
        print("New Suggestion")
        if MFMailComposeViewController.canSendMail() {
            self.showSheet = true
        } else {
            print("Error")
        }
    }
    func reportBug() {
        print("Bug Detected")
    }
}

struct SettingsTab_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTab()
    }
}


