//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var personCountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    var tipPercent = 10.0
    
    @IBOutlet weak var zeroPercentTipBtn: UIButton!
    
    @IBOutlet weak var tenPercentTipBtn: UIButton!
    
    @IBOutlet weak var twentyPercentTint: UIButton!
    
    var billCalculator = BillCalculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTipButtonPressed(_ sender: UIButton) {
        tenPercentTipBtn.isSelected = false
        zeroPercentTipBtn.isSelected = false
        twentyPercentTint.isSelected = false
        sender.isSelected = true
        
        if sender.currentTitle == "0%"{
            tipPercent = 0.0
        }
        else if sender.currentTitle == "10%"{
            tipPercent = 10.0
        }
        else if sender.currentTitle == "20%"{
            tipPercent = 20.0
        }
        print(tipPercent)
    }
    
    @IBAction func onPersonChange(_ sender: UIStepper) {
        personCountLabel.text = String(Int(sender.value))
    }
    
    
    
    @IBAction func onCalculateButtonPressed(_ sender: UIButton) {
        billCalculator.calculateBill(billAmount: billAmountTextField.text, tipPercent: Int(tipPercent), noOfPerson: personCountLabel.text
        )
        var resultVC = ResultViewController()
       
         
         self.performSegue(withIdentifier: "gotoResult", sender: self)
    
       
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if   segue.identifier == "gotoResult" {
            let destinationVc = segue.destination as! ResultViewController
         
      
      
         destinationVc.bill = billCalculator.bill

            
        }
    }
}

