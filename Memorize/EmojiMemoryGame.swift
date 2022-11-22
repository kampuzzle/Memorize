//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Paula on 9/27/22.
//
//  VIEW MODEL

import SwiftUI

class EmojiMemoryGame {
    
    static let sweetTheme = ["🍰","🍧","🍫","🍬","🍭","🥞","🧇","🍡","🍨","🧁","🎂","🍮", "🍩","🍪","🥮","🥠"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairs: 4) { pairIndex in
            sweetTheme[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
