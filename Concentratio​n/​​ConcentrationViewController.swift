//
//  ViewController.swift
//  Concentratio​n
//
//  Created by Andrey on 08.11.2022.
//  Copyright © 2022 Andrii. All rights reserved.
//

import UIKit

class ​​ConcentrationViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
            return (cardButtons.count + 1) / 2
    }
    var flipCount = 0 {
        didSet {
             flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
   
   
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet var flipCountLabel: UILabel!
   
   
    @IBAction func touchCard(_ sender: UIButton) {
         flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFormModel()
        } else {
            print("Choosen card was nit in cardButtons")
        }
        
                
    }
   
    
    func updateViewFormModel() {
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
    
    var emojiChoices = ["👹", "☠️", "👻", "👿", "🤡", "🧟‍♂️", "🧛🏻‍♀️", "🦇", "🕷"]
    var emoji = [Int: String]()
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
            return emoji[card.identifier] ?? "?"
    }
}
 
 
