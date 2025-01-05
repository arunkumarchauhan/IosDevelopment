//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
   var leftDiceNumber = 1
    var rightDiceNumber = 2
    let images = ["DiceOne","DiceTwo","DiceThree", "DiceFour", "DiceFive", "DiceSix"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButtonPressed(_ sender: Any) {      
        leftDiceNumber = Int.random(in: 1...5 )
        rightDiceNumber = Int.random(in: 1...5)
       
        diceImageView1.image = UIImage(imageLiteralResourceName: images.randomElement()!)
        diceImageView2.image = UIImage(imageLiteralResourceName: images.randomElement()!)
    
    }
    
 
}

