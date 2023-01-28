//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Paula on 11/30/22.
//


import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
