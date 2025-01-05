//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by ACC3611701 on 24/08/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


struct Question{
    let question : String
    let answer : String
    init(q:String , a:String){
        self.answer=a
        self.question=q
        
    }
}
