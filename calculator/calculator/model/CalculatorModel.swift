//
//  CalculatorModel.swift
//  calculator
//
//  Created by ACC3611701 on 09/07/24.
//

import Foundation
import SwiftUI
enum Keys:String{
    
    case one="1"
    case two="2"
    case three="3"
    case four="4"
    case five="5"
    case six="6"
    case seven="7"
    case eight="8"
    case nine="9"
    case zero="0"
    case add="+"
    case subtract="-"
    case multiply="x"
    case divide="÷" 
    case equal="="
    case clear="AC"
    case decimal="."
    case percent="%"
    case negative="-/+"
    var buttonColor:Color{
        switch(self)
        {
            case .clear,.negative,.percent:
            return Color("Hoperator")
            case .divide,.multiply,.subtract,.add,.equal:
            return Color("Voperator")
            default:
            return Color("num")
        }
    }
    
}


enum Operation{
    case add,subtract,divide,multiply,none
}
