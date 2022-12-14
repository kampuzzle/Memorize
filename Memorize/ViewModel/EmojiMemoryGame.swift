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
    
    static let vehiclesTheme = Theme(name: "Veiculos", withEmojis: ["ðē","ð","âïļ","ðĩ","ð","ð","ð","ð","ð","ðĒ", "ðī", "ð","ð","ð", "ðļ", "ðķ","ðĪ","ð"], numberOfPairs: 18, withColor: .red)
    static let animalsTheme = Theme(name: "Animais", withEmojis: ["ðĶ","ð","ð","ðĶ","ðĶ","ð", "ð","ð", "ð","ðĶ","ðĶĒ","ð","ðŧââïļ","ð§","ðĶ­"], numberOfPairs: 12, withColor: .green)
    static let sweetTheme = Theme(name: "Doces", withEmojis: ["ð°","ð§","ðŦ","ðŽ","ð­","ðĨ","ð§","ðĄ","ðĻ","ð§","ð","ðŪ", "ðĐ","ðŠ","ðĨŪ","ðĨ "], numberOfPairs: 16, withColor: .purple)
    static let flagsTheme = Theme(name: "Bandeiras", withEmojis: ["ðīó §ó Ēó ģó Ģó īó ŋ","ðĻðĶ","ðđðģ","ðĶðđ","ðĶðē","ðĶðļ","ðĶð·", "ðĶðĐ","ð§ðī","ðđðĐ","ðĻðĻ","ðĻðą","ðĐðŠ","ð­ðš","ðŊðē","ðŊðĩ","ð°ð·","ðŠðļ","ð§ð·","ðđðž"], numberOfPairs: 20, withColor: .orange)
    
    
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
