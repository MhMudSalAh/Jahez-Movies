//
//  RootView.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import SwiftUI

struct RootView: View {

    @ObservedObject var coordinator: Coordinator
    let router: RootRouter

    var body: some View {
        NavigationStack(path: $coordinator.path) {

            router.build(.splash)
                .navigationDestination(for: RootRoute.self) {
                    router.build($0)
                }
        }
        .sheet(item: $coordinator.sheet) {
            router.build($0)
        }
        .fullScreenCover(item: $coordinator.fullScreen) {
            router.build($0)
        }
    }
}
