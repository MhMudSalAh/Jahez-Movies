//
//  RootRoute.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 18/04/2026.
//

import Foundation

enum RootRoute: Hashable, Identifiable {
    case splash
    case movies
    
    var id: String { String(describing: self) }
}

