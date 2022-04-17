//
//  Card.swift
//  ConcentrationStoryboard
//
//  Created by Roie Malykin on 14/04/2022.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var indetifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        indetifierFactory += 1
        return indetifierFactory
    }
    
    init()
    {
        self.identifier = Card.getUniqueIdentifier()
    }
}
