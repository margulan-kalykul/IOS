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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // print("Check")
        
    }
    
    func playNote(note: String) {
        if let soundUrl = Bundle.main.url(forResource: note, withExtension: "wav") {
            do {
                player = try AVAudioPlayer(contentsOf: soundUrl)
                player?.play()
            }
            catch {
                print("Sound error")
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton?) {
        //sender?.backgroundColor(UIColor(named: "whitre"))
        // print("Button pressed")
        if let s = sender {
            playNote(note: s.currentTitle ?? "A")
        }
    }


}
