//
//  KFImage.swift
//  Jahez-Movies
//
//  Created by MhMuD SalAh on 19/04/2026.
//

import SwiftUI
import Kingfisher

extension KFImage {
    
    static func load(url: String) -> KFImage {
        let image = "\(EndPointEnum.image)\(url)"
        return KFImage(URL(string: image))
    }
}
