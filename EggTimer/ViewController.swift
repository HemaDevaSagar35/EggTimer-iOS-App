//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var counter = 0
    var TotalTime = 0
    var timer = Timer()
    var player : AVAudioPlayer!
    
    @IBOutlet weak var statusProgress: UIProgressView!
    @IBOutlet weak var statusResponse: UILabel!
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!, fileTypeHint: "mp3")
        player.play()

        
    }
    
    @objc func LogTime()
    {
        
         if counter < TotalTime
         {
//             print("\(counter) seconds")
             counter += 1
             let progress = Float(counter) / Float(TotalTime)
             statusProgress.progress = progress
             
         } else {
             
             statusResponse.text = "Done !"
             playSound()
             timer.invalidate()
         }
         

    }
    
    func setTimer(){
//        var countTimer:Timer!
        timer = Timer.scheduledTimer(
            timeInterval: 1 ,
            target: self,
            selector: #selector(LogTime),
            userInfo: nil,
            repeats: true)
        
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        counter = 0
        statusProgress.progress = 0.0
        
        let hardness = sender.currentTitle!
        statusResponse.text = hardness
        
//        print(eggTimes[hardness]!)
        TotalTime = eggTimes[hardness]!
        setTimer()
//        print("done")
        
        
        
        
        
        
        
    }
    

}
