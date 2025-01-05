//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by ACC3611701 on 26/08/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit


class CalculatorBrain{
    var bmi : BMI?
    
    func getBmiValue()->String{
        return String(format: "%.1f" , bmi?.value ?? 0)
    }
    func getAdvice()->String{
        return bmi?.advice ?? ""
    }
    func getColor()->UIColor{
        return bmi?.color ?? .red
    }
    func calculateBMI(height: Float , weight : Float){
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.blue)
        }
        else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Eat more fiddles!", color: UIColor.green)

        }
        else {
            bmi = BMI(value: bmiValue, advice: "Eat less fiddles!", color: UIColor.red)
        }
    }
}
