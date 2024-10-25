//
//  ViewController.swift
//  Xylo
//
//  Created by user252323 on 10/22/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    // All the buttons for the notes
    /*@IBOutlet var red: UIImageView!
    @IBOutlet var orange: UIImageView!
    @IBOutlet var yellow: UIImageView!
    @IBOutlet var lightBlue: UIImageView!
    @IBOutlet var blue: UIImageView!
    @IBOutlet var purple: UIImageView!*/
    
    var notes = [1: "A", 2: "B", 3: "C", 4: "D", 5: "E", 6: "F", 7: "G"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Check")
        
    }
    
    // function to play a note based on its name
    func playNote(note: String) {
        //print("Here1")
        if let soundUrl = Bundle.main.url(forResource: note, withExtension: "wav") {
            print("Here2")
            do {
                player = try AVAudioPlayer(contentsOf: soundUrl)
                player?.play()
                print("Played \(note) note")
            }
            catch {
                print("Sound error")
            }
        }
    }
    
    // catch a Touch Up Inside event of any button
    @IBAction func buttonPressed(_ sender: UIButton) {
        // empty color variable
        // var c: UIColor!
        print("Button pressed")
        playNote(note: notes[sender.tag]!)
        // sender.backgroundColor = UIColor.white
    }


}
