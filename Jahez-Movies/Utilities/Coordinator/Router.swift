//
//  Router.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import Foundation

protocol Router {
    func push(_ route: RootRoute)
    func presentSheet(_ route: RootRoute)
    func presentFullScreen(_ route: RootRoute)
    func popTo(_ route: RootRoute)
    func popToRoot()
    func dismissSheet()
    func dismissFullScreen()
}

protocol RouterMiddleware {
    func process(route: RootRoute)
}
