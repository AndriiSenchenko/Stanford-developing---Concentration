//
//  Concentration.swift
//  Concentratio​n
//
//  Created by Andrey on 11.11.2022.
//  Copyright © 2022 Andrii. All rights reserved.
//

import Foundation


class Concentration {
    var cards = [Card]()
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
             cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
    }
}
