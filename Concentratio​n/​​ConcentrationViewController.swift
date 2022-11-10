//
//  ViewController.swift
//  Concentratio​n
//
//  Created by Andrey on 08.11.2022.
//  Copyright © 2022 Andrii. All rights reserved.
//

import UIKit

class ​​ConcentrationViewController: UIViewController {
    @IBAction func touchSecondCard(_ sender: UIButton) {
         flipCard(withEmoji: "🎃", on: sender)
    }
    @IBAction func touchCard(_ sender: UIButton) {
         flipCard(withEmoji: "👻", on: sender)
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
 
 
