//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by ACC3611701 on 25/08/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController{
    var  bmi=""
    var backgroundColor : UIColor = .blue
    var advice : String = ""
    @IBOutlet weak var resultBackground: UIImageView!
    
    @IBOutlet weak var suggestionTextView: UILabel!
    @IBOutlet weak var bmiTextView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiTextView.text = bmi
        resultBackground.backgroundColor = backgroundColor
        suggestionTextView.text = advice
    }
    @IBAction func onRecalculateClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
