//
//  BillCalculator.swift
//  Tipsy
//
//  Created by ACC3611701 on 27/08/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct BillCalculator{
    var bill : Bill?
    
   mutating func calculateBill(billAmount : String?, tipPercent:Int, noOfPerson: String?){
        
        if let text = billAmount{
            if text.isEmpty{
                bill = nil
            }
            do{
              var  amount = try! Double(text)
                let peopleCount = Int(noOfPerson ?? "1" )!
                
                bill = Bill(amount: amount!, noOfPeople: peopleCount , tipPercent: tipPercent)
                
                
            }catch {
                bill = Bill(amount:0.0, noOfPeople: 1, tipPercent: 0)
                print(error)
            }
        }
        
      
    }
}
