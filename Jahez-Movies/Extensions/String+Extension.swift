//
//  String+Extension.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import Foundation

extension String {
    
    var isURL: Bool {
        return self.hasPrefix("http://") || self.hasPrefix("https://")
    }
    
    var month: Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormate.default
        dateFormatter.locale = Locale(identifier: "en_US")
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: date)
    }
    
    var year: Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormate.default
        dateFormatter.locale = Locale(identifier: "en_US")
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "YYYY"
        return dateFormatter.string(from: date)
    }

    var monthYear: Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormate.default
        dateFormatter.locale = Locale(identifier: "en_US")
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "MMM YYYY"
        return dateFormatter.string(from: date)
    }

    var dayMonth: Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormate.default
        dateFormatter.locale = Locale(identifier: "en_US")
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "dd MMM"
        return dateFormatter.string(from: date)
    }
}
