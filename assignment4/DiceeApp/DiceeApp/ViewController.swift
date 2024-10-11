//
//  ViewController.swift
//  DiceeApp
//
//  Created by Student on 11.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var diceImage1: UIImageView!
    @IBOutlet var diceImage2: UIImageView!
    
    let diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // diceImage1 = UIImageView(image: UIImage(named: "dice4"))
        diceImage1.image = UIImage(named: "dice4")
        diceImage2.image = UIImage(named: "dice4")
    }

    @IBAction func rollDices(_ sender: UIButton) {
        let num1 = Int.random(in: 0..<diceImages.count)
        let num2 = Int.random(in: 0..<diceImages.count)
        
        diceImage1.image = UIImage(named: diceImages[num1])
        diceImage2.image = UIImage(named: diceImages[num2])
    }
}

