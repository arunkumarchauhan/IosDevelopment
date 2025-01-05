//
//  ResultViewController.swift
//  Tipsy
//
//  Created by ACC3611701 on 27/08/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit
class ResultViewController : UIViewController{
    var bill:Bill?
    @IBOutlet weak var descriptionLabelView: UILabel!
    @IBOutlet weak var billPerPersonLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        billPerPersonLabel.text = bill?.getAmountPerPerson() ?? "0.0"
        descriptionLabelView.text = "Split between \(bill?.noOfPeople ?? 0) people with \(bill?.tipPercent ?? 0)%  tip"
    }
    @IBAction func onReCalculateClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

