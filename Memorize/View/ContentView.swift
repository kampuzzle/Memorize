//
//  ContentView.swift
//  Memorize
//
//  Created by Paula on 11/30/22.
//
//  VIEW

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("MEMORIZE!")
                .font(.title)
                .bold()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                    }
                }
            }
            HStack(alignment: .firstTextBaseline) {
                newGame.padding(.horizontal)
                info.padding(.horizontal)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var newGame: some View {
        Button(action: viewModel.newGame, label: {
            VStack {
                Image(systemName: "play.fill").font(.largeTitle)
                Text("Novo Jogo")
            }
        })
    }
    
    var info: some View {
        VStack {
            Text("Tema atual: \(viewModel.currentTheme.name)")
            Text("Pontos: \(viewModel.score)")
        }
    }
}
