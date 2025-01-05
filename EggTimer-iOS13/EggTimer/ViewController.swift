//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var soft = 5
    var medium = 7
    var hard = 10
    var timeMap = ["Soft" : 5, "Medium" : 7 , "Hard" : 10]
    var secondsRemaining = 0
    var totalTime=0
    var timer = Timer()
    @IBAction func onEggPressed(_ sender: UIButton) {
        
//        if sender.titleLabel?.text == "Soft"{
//            print("Soft")
//        }
//        else if sender.currentTitle == "Medium" {
//            print("Medium")
//        }
//        else {
//            print("Hard")
//        }
        
//        switch sender.currentTitle{
//        case "Soft": print(soft)
//        case "Medium" : print(medium)
//        case "Hard" : print(hard)
//        default : print("Bhak Bsdk")
//        }
        
        statusLabel.text="Cooking \(sender.currentTitle!)"
        timer.invalidate()
        self.secondsRemaining = 0 //* 60
        totalTime=timeMap[sender.currentTitle!]!
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
//                if self.secondsRemaining > 0 {
//                    print ("\(self.secondsRemaining) seconds")
//                    self.secondsRemaining -= 1
//                } else {
//                    Timer.invalidate()
//                }
//            }
        timer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
       
        if secondsRemaining<totalTime{
  
          
            self.secondsRemaining+=1
            progressBar.progress = Float(self.secondsRemaining)/Float(self.totalTime)
            
        }
        else {
            progressBar.progress=0
            timer.invalidate()
            statusLabel.text = "Done"
        }
    }
    
    
}
