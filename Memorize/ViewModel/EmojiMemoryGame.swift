//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Paula on 9/27/22.
//
//  VIEW MODEL

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    // MARK: - Themes
    
    typealias Card = MemoryGame<String>.Card
    
    private let availableThemes = [vehiclesTheme, animalsTheme, sweetTheme, flagsTheme]
    static let vehiclesTheme = ["🚲","🚘","✈️","🛵","🚌","🚑","🚒","🏍","🚀","🚢", "🛴", "🚃","🚖","🚁", "🛸", "🛶","🚤","🚂"]
    static let animalsTheme = ["🦖","🐅","🐆","🦒","🦙","🐑", "🐕","🐈", "🐍","🦜","🦢","🐇"]
    static let sweetTheme = ["🍰","🍧","🍫","🍬","🍭","🥞","🧇","🍡","🍨","🧁","🎂","🍮", "🍩","🍪","🥮","🥠"]
    static let flagsTheme = ["🇧🇷","🇨🇩","🇦🇹","🇦🇷","🇦🇲","🇦🇸","🇦🇩","🇧🇴","🇹🇩","🇨🇨","🇨🇦","🇨🇱","🇩🇪","🇭🇺" ,"🇯🇲","🇯🇵","🇰🇷","🇪🇸","🇹🇼","🇹🇳","🏴󠁧󠁢󠁳󠁣󠁴󠁿"]
    
    // MARK: - Other variables
    
    private(set) var theme: Theme = Theme(name: "Doces", withEmojis: sweetTheme, numberOfPairs: 8, withColor: .purple)
    
    @Published private var model: MemoryGame<String>
    @Published var currentTheme: Theme
    var score: Int { model.score }
    var cards: [Card] { model.cards }
    
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
