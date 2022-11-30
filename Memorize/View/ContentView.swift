//
//  ContentView.swift
//  Memorize
//
//  Created by Paula on 9/21/22.
//
//  VIEW

import SwiftUI

struct ContentView: View {
    
    static let vehiclesTheme = ["🚲","🚘","✈️","🛵","🚌","🚑","🚒","🏍","🚀","🚢", "🛴", "🚃","🚖","🚁", "🛸", "🛶","🚤","🚂"]
    static let animalsTheme = ["🦖","🐅","🐆","🦒","🦙","🐑", "🐕","🐈", "🐍","🦜","🦢","🐇"]
    static let sweetTheme = ["🍰","🍧","🍫","🍬","🍭","🥞","🧇","🍡","🍨","🧁","🎂","🍮", "🍩","🍪","🥮","🥠"]
    @State var theme = ["🚲","🚘","✈️","🛵","🚌","🚑","🚒","🏍","🚀","🚢", "🛴", "🚃","🚖","🚁", "🛸", "🛶","🚤","🚂"]
    
    @ObservedObject var viewModel: EmojiMemoryGame
        
    var body: some View {
        VStack {
            Text("MEMORIZE!")
                .font(.largeTitle)
                .bold()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture{
                                viewModel.choose(card)
                            }
                    }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var changeTheme: some View {
        HStack {
            Button {
                theme = ContentView.sweetTheme.shuffled()
            } label: {
                VStack {
                    Image(systemName: "fork.knife.circle")
                    Text("Food").font(.body)
                }
            }
            Spacer()
            Button {
                theme = ContentView.animalsTheme.shuffled()
            } label: {
                VStack {
                    Image(systemName: "pawprint.circle")
                    Text("Animals").font(.body)
                }
            }
            Spacer()
            Button {
                theme = ContentView.vehiclesTheme.shuffled()
            } label: {
                VStack {
                    Image(systemName: "car")
                    Text("Vehicles").font(.body)
                }
            }
        }
        .foregroundColor(.accentColor)
    }
}













//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: EmojiMemoryGame())
//            .preferredColorScheme(.dark)
//        ContentView(viewModel: EmojiMemoryGame())
//            .preferredColorScheme(.light)
//    }
//}
