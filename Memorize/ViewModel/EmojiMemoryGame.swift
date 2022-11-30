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
    
    private(set) var theme: Theme
    
    init(theme: Theme) {
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }
    
    static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        let shuffledItens = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairs: 8) { pairIndex in
            shuffledItens[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String>

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
    func changeTheme(to theme: Theme) {
        self.theme = theme
        model = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
