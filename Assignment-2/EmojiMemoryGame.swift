//
//  EmojiMemoryGame.swift
//  CS193P-Memorize-AS1
//
//  Created by TheKoalaBear on 11/06/2021.
//

import SwiftUI

let emptyEmojiTheme = MemoryGameTheme<String,Color>(name: "", contents: [], pairsAmount: 0, foregroundColor: .white, backgroundColor: .black)
var emojiMemoryGameThemes: [MemoryGameTheme<String,Color>] = [MemoryGameTheme(name: "Smilies", contents: ["😇", "😀", "😁", "🥰", "😌", "🥸", "😎", "🤫", "🐨"], pairsAmount: 6, foregroundColor: .red, backgroundColor: .green)]


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String, Color> = createMemoryGame()
    static var theme = emojiMemoryGameThemes.randomElement()

    static func createMemoryGame() -> MemoryGame<String, Color> {
        return MemoryGame<String,Color>(theme: emojiMemoryGameThemes.randomElement() ?? emptyEmojiTheme)
    }
        
    var cards: Array<MemoryGame<String, Color>.Card> {
        model.cards
    }
    
    var themeName: String {
        model.theme.name
    }
    
    var score: Int {
        model.score
    }
    
    func choose(_ card: MemoryGame<String, Color>.Card) {
        model.choose(card)
    }
    
    private static func randomizeTheme() {
        EmojiMemoryGame.theme = emojiMemoryGameThemes.randomElement()
    }
    
    func changeTheme() {
        EmojiMemoryGame.randomizeTheme()
        self.model = EmojiMemoryGame.createMemoryGame()
    }
}
