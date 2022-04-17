//
//  Concentration.swift
//  ConcentrationStoryboard
//
//  Created by Roie Malykin on 14/04/2022.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    let numOfPairsOfCards: Int
    
    var indexOfOneAndOnlyOneFaceUpCard: Int?
    var flipCounter = 0
        
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard , matchIndex != index {
                // Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = nil
           }else {
                // either no cards or 2 cards are face up
               for flipDownIndex in cards.indices{
                   cards[flipDownIndex].isFaceUp = false
               }
               cards[index].isFaceUp = true
               indexOfOneAndOnlyOneFaceUpCard = index
            }
            
        }
        flipCounter += 1
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card,card]
        }
        self.numOfPairsOfCards = numberOfPairsOfCards
        cards.shuffle()
        
        
    }
    
}
