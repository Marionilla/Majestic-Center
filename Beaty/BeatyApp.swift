//
//  BeatyApp.swift
//  Beaty
//
//  Created by Марина Михайлова on 17.01.2021.
//

import SwiftUI
import Firebase
@main
struct BeatyApp: App {
    init() {
        FirebaseApp.configure()
    }
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainMenu()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
