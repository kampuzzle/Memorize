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
            ForEach(emojis, id: \.self, content: { emoji in
                CardView(content: emoji)
            })
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
