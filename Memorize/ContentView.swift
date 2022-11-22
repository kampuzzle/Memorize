//
//  ContentView.swift
//  Memorize
//
//  Created by Paula on 9/21/22.
//
//  VIEW

import SwiftUI

struct ContentView: View {
    
    var vehiclesTheme = ["🚲","🚘","✈️","🛵","🚌","🚑","🚒","🏍","🚀","🚢", "🛴", "🚃","🚖", "🚁","🛸","🛶","🚤","🚂"]
    var sweetTheme = ["🍰","🍧","🍫","🍬","🍭","🥞","🧇","🍡","🍨","🧁","🎂","🍮", "🍩","🍪","🥮","🥠"]
    var animalsTheme = ["🦖","🐅","🐆","🦒","🦙","🐑", "🐕","🐈", "🐍","🦜","🦢","🐇"]
    
    
    @State var theme = ["🦖","🐅","🐆","🦒","🦙","🐑", "🐕","🐈", "🐍","🦜","🦢","🐇"].shuffled()
    
    var body: some View {
        VStack {
            Text("MEMORIZE!")
                .font(.largeTitle)
                .bold()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(theme[0..<theme.count], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            HStack {
                changeTheme
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
    
    var changeTheme: some View {
        HStack {
            Button {
                theme = sweetTheme.shuffled()
            } label: {
                VStack {
                    Image(systemName: "fork.knife.circle")
                    Text("Food").font(.body)
                }
            }
            Spacer()
            Button {
                theme = animalsTheme.shuffled()
            } label: {
                VStack {
                    Image(systemName: "pawprint.circle")
                    Text("Animals").font(.body)
                }
            }
            Spacer()
            Button {
                theme = vehiclesTheme.shuffled()
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

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.system(size: 60))
            } else {
                shape
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
