//
//  MemoryGame.swift
//  CS193P-Memorize-AS1
//
//  Created by TheKoalaBear on 11/06/2021.
//

import Foundation



struct MemoryGame<CardContent: Equatable & Hashable, Color> {
    private(set) var cards: Array<Card>
    private var revealedCardIndex: Int?
    private(set) var theme: MemoryGameTheme<CardContent,Color>
    private(set) var score: Int = 0
    
    init(theme: MemoryGameTheme<CardContent,Color>) {
        self.theme = theme
        self.cards = Array<Card>()
        self.cards += createCards()
    }
    
    func createCards() -> Array<Card> {
        var newCards = Array<Card>()
        let shuffledContents = theme.contents.shuffled().removingDuplicates()
        
        for pairIndex in 0..<theme.pairsAmount {
            let content = shuffledContents[pairIndex]
            newCards += [Card(content: content, id: pairIndex*2), Card(content: content, id: pairIndex*2+1)]
        }
        return newCards.shuffled()
    }

    
    mutating func choose(_ card: Card) {
        if let chosenCardIndex = cards.firstIndex(where: { arrayCard in arrayCard.id == card.id && !arrayCard.isMatched && !arrayCard.isFaceUp}) {
            if let revealedCardIndex = self.revealedCardIndex {
                print("Revealed Card Index NOT NIL")
                if cards[chosenCardIndex].content == cards[revealedCardIndex].content {
                    matchedCards(chosenIndex: chosenCardIndex, revealedIndex: revealedCardIndex)
                } else {
                    if cards[chosenCardIndex].wasRevealed || cards[revealedCardIndex].wasRevealed {
                        self.score -= 1
                    }
                }
                markPairRevealed(cardIndex: chosenCardIndex, pairCardIndex: revealedCardIndex)
                self.revealedCardIndex = nil
            } else {
                print("Revealed Card Index IS nil")
                self.revealedCardIndex = chosenCardIndex
                faceCardsDown()
            }
            cards[chosenCardIndex].isFaceUp.toggle()
        }
    }
    
    mutating func faceCardsDown() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }
    
    mutating func markPairRevealed(cardIndex: Int, pairCardIndex: Int) {
        cards[cardIndex].wasRevealed = true
        cards[pairCardIndex].wasRevealed = true
    }
    
    mutating func matchedCards(chosenIndex: Int, revealedIndex: Int) {
        cards[chosenIndex].isMatched = true
        cards[revealedIndex].isMatched = true
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var wasRevealed: Bool = false
        var content: CardContent
        var id: Int
    }
    
}

