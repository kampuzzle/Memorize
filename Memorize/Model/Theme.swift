//
//  Theme.swift
//  Memorize
//
//  Created by Paula on 12/07/22.
//

import Foundation
import SwiftUI

struct Theme {
    var name: String
    var emojis: Array<String>
    var color: Color
    var numberOfPairs: Int
    
    init(name: String, withEmojis emojis: Array<String>, numberOfPairs: Int, withColor color: Color) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairs = numberOfPairs 
        self.color = color
    }
}
