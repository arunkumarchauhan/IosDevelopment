//
//  WeatherManager.swift
//  Clima
//
//  Created by ACC3611701 on 28/08/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
struct WeatherManager{
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=93b1c91bca941df8719eadf1b2bc9654&units=metric"
    func fetchWeather(city:String){
        let urlString = "\(weatherUrl)&q=\(city)"
        performRequest(with: urlString)
        
        
    }
    
    func fetchWeather(latitude:Double,longitude:Double){
        let urlString = "\(weatherUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
        
        
    }
    var delegate :WeatherManagerDelegate?
    
     func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url){ data,response, error in
                if error != nil {
                    print("Error \(error)")
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                let weather = parseJson(data: data)
                if weather != nil{
                    self.delegate?.didWeatherUpdate(weather:weather!)
                }
            }
            task.resume()
            
        }
        
        
    }
    
    func parseJson(data:Data?)->WeatherModel?{
        if let safeData = data{
            
            let dataString = String(data: safeData, encoding:.utf8 )
            print(dataString ?? "")
            do {
                let decodedData = try JSONDecoder().decode(WeatherData.self, from: safeData)
                let id = decodedData.weather[0].id
                let name = decodedData.name
                let temp = decodedData.main.temp
                
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                print(weather.conditionName)
             
                
                return weather
            }catch {
                if error  != nil{
                    self.delegate?.didFailWithError(error: error)

                }
                print(error)
            }
        
        }
        return nil
    }
    

    
    
}
