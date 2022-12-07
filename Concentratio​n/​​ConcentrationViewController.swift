//
//  ViewController.swift
//  Concentratio​n
//
//  Created by Andrey on 08.11.2022.
//  Copyright © 2022 Andrii. All rights reserved.
//

import UIKit

class ​​ConcentrationViewController: UIViewController {
   private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
            return (cardButtons.count + 1) / 2
    }
   private (set) var flipCount = 0 {
        didSet {
             flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
   
   
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private var flipCountLabel: UILabel!
   
   
    @IBAction private func touchCard(_ sender: UIButton) {
         flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFormModel()
        } else {
            print("Choosen card was nit in cardButtons")
        }
        
                
    }
   
    
   private func updateViewFormModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
   private var emojiChoices = ["👹", "☠️", "👻", "👿", "🤡", "🧟‍♂️", "🧛🏻‍♀️", "🦇", "🕷"]
   private var emoji = [Int: String]()
   private func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
            return emoji[card.identifier] ?? "?"
    }
}
 
 
