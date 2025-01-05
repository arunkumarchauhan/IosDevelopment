//
//  Weather.swift
//  Clima
//
//  Created by ACC3611701 on 28/08/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable{
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Decodable{
    let temp: Double
}
struct Weather : Decodable{
    let main: String
    let description : String
    let icon : String
    let id : Int
}

