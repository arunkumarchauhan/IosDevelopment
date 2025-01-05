//
//  Bill.swift
//  Tipsy
//
//  Created by ACC3611701 on 27/08/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Bill{
    var amount : Double
    var noOfPeople : Int
    var tipPercent : Int
    
    func getTipPercent()->String{
        return String(tipPercent)
    }
    func getNoOfPeople()->String{
        return String(noOfPeople)
    }
    func getAmountPerPerson()->String{
        
        let amountPer = (amount + ((amount * Double(tipPercent))/100) ) / Double(noOfPeople)
        
        return String(format : "%.2f", amountPer)
    }
}
