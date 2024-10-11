//
//  ViewController.swift
//  Dices
//
//  Created by user252323 on 10/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var diceImage1: UIImageView!
    @IBOutlet var diceImage2: UIImageView!
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImage1.image = UIImage(named: "dice1")
        diceImage2.image = UIImage(named: "dice1")
    }
    
    
    @IBAction func rollDices(_ sender: UIButton) {
        let num1 = Int.random(in: 0..<diceImages.count)
        let num2 = Int.random(in: 0..<diceImages.count)
                
        diceImage1.image = UIImage(named: diceImages[num1])
        diceImage2.image = UIImage(named: diceImages[num2])
    }
    
}

