//
//  ViewController.swift
//  Concentratio​n
//
//  Created by Andrey on 08.11.2022.
//  Copyright © 2022 Andrii. All rights reserved.
//

import UIKit

class ​​ConcentrationViewController: UIViewController {
    var flipCount = 0 {
        didSet {
             flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoices = ["👹", "☠️", "👹", "☠️"]
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet var flipCountLabel: UILabel!
   
   
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Choosen card was nit in cardButtons")
        }
        flipCount += 1
                
    }
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
}
 
 
