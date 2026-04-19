//
//  RootFactory.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import SwiftUI

struct RootFactory {
        
    static func makeView(
        coordinator: Coordinator,
        router: RootRouter
    ) -> some View {
        RootView(coordinator: coordinator, router: router)
    }
}
