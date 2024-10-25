//
//  ViewController.swift
//  EggTimer
//
//  Created by user252323 on 10/23/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var softEgg: UIButton!
    @IBOutlet var mediumEgg: UIButton!
    @IBOutlet var hardEgg: UIButton!
    
    // Times for each egg to cook (1 is soft egg, etc.)
    var eggTimes = [1: 5, 2: 7, 3: 10]
    
    var currentTimer: Timer?
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reset the progress bar
        progressBar.progress = 0.0
    }
    
    func playSound() {
        if let soundUrl = Bundle.main.url(forResource: "beeping", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundUrl)
                player?.play()
                print("Beeping")
            }
            catch {
                print("Sound error")
            }
        }
    }
    @IBAction func eggTapped(_ sender: UIButton) {
        if let currentTimer {
            currentTimer.invalidate()
        }
        var cookTime: Int = eggTimes[sender.tag]!, curTime = cookTime
        currentTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.progressBar.progress = Float(curTime) / Float(cookTime)
            if curTime == 0 {
                print("Its time")
                self.progressBar.progress = 0.0
                self.playSound()
                self.currentTimer!.invalidate()
            }
            curTime -= 1
            print(self.progressBar.progress)
        }
        
    }
    
    
}

