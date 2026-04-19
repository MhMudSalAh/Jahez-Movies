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

    @StateObject private var coordinator = Coordinator(
        middleware: [
            // TODO: - Add AnalyticsMiddleware
        ]
    )
    
    private var container: RootContainer {
        RootContainer(router: coordinator)
    }

    private var router: RootRouter {
        RootRouter(container: container)
    }

    var body: some Scene {
        WindowGroup {
            RootFactory.makeView(
                coordinator: coordinator,
                router: router
            )
        }
    }

}
