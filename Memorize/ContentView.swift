//
//  ContentView.swift
//  Memorize
//
//  Created by Paula on 9/21/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚲","🚘","✈️","🛵"]
    
    var body: some View {
        HStack{
            CardView(content: emojis[0])
            CardView(content: emojis[1])
            CardView(content: emojis[2])
            CardView(content: emojis[3])
        }
        .padding(.horizontal)
        .foregroundColor(.blue)

    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                shape.foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
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
