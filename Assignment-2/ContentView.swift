//
//  ContentView.swift
//  CS193P - Memorize (Assignment 2)
//
//  Created by TheKoalaDeveloper on 29/05/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.themeName).bold().font(.largeTitle)
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], content: {
                ForEach(viewModel.cards) { card in
                    CardView(card: card, fgColor: EmojiMemoryGame.theme!.foregroundColor, bgColor: EmojiMemoryGame.theme!.backgroundColor)
                        .aspectRatio(3/4, contentMode: .fit).onTapGesture {
                            viewModel.choose(card)
                        }
                }
            })
            Spacer()
            
            Button(action: {
                viewModel.changeTheme()
            }) {
                Text(String(viewModel.score)).fontWeight(.semibold).font(.title3).padding().background(Color.green).cornerRadius(15.0)
            }
        }.padding(10)
    }
}


struct CardView: View {
    var card: MemoryGame<String,Color>.Card
    var fgColor: Color = .red
    var bgColor: Color = .green
    

    var body: some View {
        ZStack {
            let shape =  RoundedRectangle(cornerRadius: 25.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(self.fgColor)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill().foregroundColor(self.bgColor)
            }
        }.font(.largeTitle)
    }
}


let bigButtonConfiguration = UIImage.SymbolConfiguration(scale: .medium)

















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game).preferredColorScheme(.dark)
            ContentView(viewModel: game).preferredColorScheme(.light)
        }
    }
}
