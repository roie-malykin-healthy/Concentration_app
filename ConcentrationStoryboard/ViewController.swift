//
//  ViewController.swift
//  ConcentrationStoryboard
//
//  Created by Roie Malykin on 13/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var numOfPairsOfCards = (cardButtons.count / 2)
    lazy var game = Concentration(numberOfPairsOfCards: numOfPairsOfCards )
    
    
    /**
     * This function assumes all pairs of cards are matched , it flips all cards face up , shows end game message , and reveals new game button
     *
     */
    func endGameView(){
        game = Concentration(numberOfPairsOfCards: numOfPairsOfCards)
        emojiChoices = emojiLibrary[Int(arc4random_uniform(UInt32(emojiLibrary.count)))]
    }
    
    lazy var flipCount: Int = game.flipCounter {
        didSet {
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    var pairMatchCount: Int = 0 {
        didSet{
            if pairMatchCount == numOfPairsOfCards {
                endGameView()
            }
        }
    }
    
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        endGameView()
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var endGameMsg: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    // Init all cards with  orange backround
    //for cardButton in cardButtons {
    //    cardbutton.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    //}
    
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                //button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIButton.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
    }
    
    
    
    var emojiLibrary: [[String]] = [["👻","🐍","🦇","🕸","⚡️","😶‍🌫️","😈","☠️"],["🐶","🐨","🦆","🦊","🐸","🐙","🪱","🦋"],["🍎","🍇","🍌","🥑","🍔","🍗","🍕","🍒"],["⚽️","🏈","🏀","🎱","🏉","🥏","🎾","⚾️"],
        ["🚖","🚘","🚔","🚍","🚜","🚛","🛵","🚲"],
        ["🇦🇺","🇨🇦","🇮🇱","🇵🇱","🇺🇦","🇹🇷","🏴󠁧󠁢󠁷󠁬󠁳󠁿","🇺🇸"]
        ]
    lazy var emojiChoices = emojiLibrary[Int(arc4random_uniform(UInt32(emojiLibrary.count)))]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
            
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Chosen card was not in cardButton! - > This is a bug")
        }
    }
        
        
      
        
        
        
        
        
        
    }

