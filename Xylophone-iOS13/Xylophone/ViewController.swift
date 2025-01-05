//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onKeyPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            sender.alpha=0.5
        }
            
        playSound(soundName: sender.titleLabel?.text ?? "" )
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            UIView.animate(withDuration: 0.5) {
                sender.alpha=1            }
        })
    }
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName , withExtension: "wav")
        
        player = try? AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    

}

