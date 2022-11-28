//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Paula on 9/27/22.
//
//  VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let vehiclesTheme = ["🚲","🚘","✈️","🛵","🚌","🚑","🚒","🏍","🚀","🚢", "🛴", "🚃","🚖","🚁", "🛸", "🛶","🚤","🚂"]
    static let animalsTheme = ["🦖","🐅","🐆","🦒","🦙","🐑", "🐕","🐈", "🐍","🦜","🦢","🐇"]
    static let sweetTheme = ["🍰","🍧","🍫","🍬","🍭","🥞","🧇","🍡","🍨","🧁","🎂","🍮", "🍩","🍪","🥮","🥠"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairs: 4) { pairIndex in
            sweetTheme[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
