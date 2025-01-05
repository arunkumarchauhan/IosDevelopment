//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var weigthTextView: UILabel!
    @IBOutlet weak var heightTextView: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onHeightSlide(_ sender: UISlider) {
        print(sender.value)
        
        heightTextView.text = "\(String(format: "%.2f",  sender.value))m"
    }
    
    @IBAction func onWeightSlide(_ sender: UISlider) {
        weigthTextView.text = "\(String(format: "%.0f", sender.value))Kg"
    }
    
    @IBAction func onCalculateClick(_ sender: UIButton) {
      let height = heightSlider.value
       let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
    
        
        self.performSegue(withIdentifier: "goToResult", sender: sender)
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?){
       if segue.identifier == "goToResult"{
           let vc = segue.destination as! ResultViewController
          
           vc.bmi = calculatorBrain.getBmiValue()
           vc.advice = calculatorBrain.getAdvice()
           vc.backgroundColor = calculatorBrain.getColor()
           
       }
       
     
    }
 
    
}

