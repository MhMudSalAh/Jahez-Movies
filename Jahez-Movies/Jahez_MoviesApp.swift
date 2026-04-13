//
//  Jahez_MoviesApp.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 13/04/2026.
//

import SwiftUI
import CoreData

@main
struct Jahez_MoviesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
