//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Paula on 12/01/22.
//
//  VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // MARK: - Themes
    
    typealias Card = MemoryGame<String>.Card
    
    private let availableThemes = [vehiclesTheme, animalsTheme, sweetTheme, flagsTheme]
    
    static let vehiclesTheme = Theme(name: "Veiculos", withEmojis: ["🚲","🚘","✈️","🛵","🚌","🚑","🚒","🏍","🚀","🚢", "🛴", "🚃","🚖","🚁", "🛸", "🛶","🚤","🚂"], numberOfPairs: 18, withColor: .red)
    static let animalsTheme = Theme(name: "Animais", withEmojis: ["🦖","🐅","🐆","🦒","🦙","🐑", "🐕","🐈", "🐍","🦜","🦢","🐇","🐻‍❄️","🐧","🦭"], numberOfPairs: 12, withColor: .green)
    static let sweetTheme = Theme(name: "Doces", withEmojis: ["🍰","🍧","🍫","🍬","🍭","🥞","🧇","🍡","🍨","🧁","🎂","🍮", "🍩","🍪","🥮","🥠"], numberOfPairs: 16, withColor: .purple)
    static let flagsTheme = Theme(name: "Bandeiras", withEmojis: ["🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇨🇦","🇹🇳","🇦🇹","🇦🇲","🇦🇸","🇦🇷", "🇦🇩","🇧🇴","🇹🇩","🇨🇨","🇨🇱","🇩🇪","🇭🇺","🇯🇲","🇯🇵","🇰🇷","🇪🇸","🇧🇷","🇹🇼"], numberOfPairs: 20, withColor: .orange)
    
    
    // MARK: - Other variables
    
    @Published private var model: MemoryGame<String>
    @Published var currentTheme: Theme
    var score: Int { model.score }
    var cards: [Card] { model.cards }
    
    init() {
        let randomTheme = availableThemes.randomElement()!
        let cardsContent = randomTheme.emojis.shuffled()
        self.model = MemoryGame<String>(numberOfPairs: 8) { pairIndex in
            cardsContent[pairIndex]
        }
        self.currentTheme = randomTheme
    }

    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
    func newGame() {
        let randomTheme = availableThemes.randomElement()!
        let cardsContent = randomTheme.emojis.shuffled()
        model = MemoryGame<String>(numberOfPairs: 8) { pairIndex in
            cardsContent[pairIndex]
        }
        currentTheme = randomTheme
    }
}
