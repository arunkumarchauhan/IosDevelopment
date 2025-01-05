//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by ACC3611701 on 30/08/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didWeatherUpdate(weather:WeatherModel)
    func didFailWithError(error:Error)
}
