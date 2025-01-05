//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

import CoreLocation

class WeatherViewController: UIViewController {
   
 
    

    @IBOutlet weak var searchTextField: UITextField!
   
    @IBOutlet weak var conditionImageView: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchTextField.delegate = self
        
        weatherManager.delegate = self
        // Do any additional setup after loading the view.
        
        getCurrentLocationWeather()
    }
 
    @IBAction func onLocationButtonPressed(_ sender: UIButton) {
        getCurrentLocationWeather()
    }
    
    func getCurrentLocationWeather(){
        if let location = locationManager.location{
            print(location)
            weatherManager.fetchWeather(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }

    }
  
}

//MARK: WeatherViewController UiTextFieldDelegate Extension

extension  WeatherViewController : UITextFieldDelegate{
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let city = self.searchTextField.text{
            searchTextField.endEditing(true)
            weatherManager.fetchWeather(city: city)
            searchTextField.text = ""
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(textField.text)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {

        if let city = self.searchTextField.text{
            print("textFieldDidEndEditing Called \(city)")
            weatherManager.fetchWeather(city: city)
        }
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != ""{
            return true
        }
        else{
            self.searchTextField.placeholder
            = "Type Something Here..."
            return false
        }
    }
    
}



//MARK: - WeatherManagerDelegate Extension

extension WeatherViewController: WeatherManagerDelegate{
    
    func didWeatherUpdate(weather: WeatherModel) {
        print("Inside didWeatherUpdate \(weather.temperature)")
        DispatchQueue.main.async {
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.temperatureLabel.text = weather.temparetureString
            self.cityLabel.text = weather.cityName
        }
      
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}


//MARK: - WeatherViewController LocationManager delegate

extension WeatherViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got Location \(locations.last)")
        
        
       
    }
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
    print("Location Fetch Error \(error)")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Fetch Error \(error)")    }
}
