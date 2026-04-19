//
//  Coordinator.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 17/04/2026.
//

import SwiftUI
import Combine

final class Coordinator: ObservableObject, Router {
    
    @Published var path = NavigationPath()
    private(set) var stack: [RootRoute] = []
    
    @Published var sheet: RootRoute?
    @Published var fullScreen: RootRoute?
    
    private let middleware: [RouterMiddleware]
    
    init(middleware: [RouterMiddleware] = []) {
        self.middleware = middleware
    }
    
    func push(_ route: RootRoute) {
        handle(route)
        stack.append(route)
        path.append(route)
    }
    
    func presentSheet(_ route: RootRoute) {
        handle(route)
        sheet = route
    }
    
    func presentFullScreen(_ route: RootRoute) {
        handle(route)
        fullScreen = route
    }
    
    func goBack() {
        guard !stack.isEmpty else { return }
        stack.removeLast()
        path.removeLast()
    }
    
    func popTo(_ route: RootRoute) {
        if let index = stack.firstIndex(of: route) {
            stack = Array(stack.prefix(through: index))
            path = NavigationPath(stack)
        } else {
            popToRoot()
        }
    }
    
    func popToRoot() {
        stack.removeAll()
        path = NavigationPath()
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func dismissFullScreen() {
        fullScreen = nil
    }
    
    private func handle(_ route: RootRoute) {
        middleware.forEach { $0.process(route: route) }
    }
}
