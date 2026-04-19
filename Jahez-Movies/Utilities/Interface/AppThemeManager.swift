//
//  AppThemeManager.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 15/04/2026.
//

import SwiftUI
import Combine

enum AppTheme: String, CaseIterable, Identifiable {
    case light, dark, system
    
    var id: String { rawValue }
    
    var colorScheme: ColorScheme? {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .system: return nil
        }
    }
    
    var displayName: String {
        switch self {
        case .light: return "Light"
        case .dark: return "Dark"
        case .system: return "System"
        }
    }
}

@MainActor
final class AppThemeManager: ObservableObject {
    @AppStorage("selectedTheme") var selectedTheme: String = AppTheme.system.rawValue {
        didSet { objectWillChange.send() }
    }
    
    static let shared = AppThemeManager()
    private init() {}
    
    var currentTheme: AppTheme {
        AppTheme(rawValue: selectedTheme) ?? .system
    }
    
    var colorScheme: ColorScheme? {
        currentTheme.colorScheme
    }
}
