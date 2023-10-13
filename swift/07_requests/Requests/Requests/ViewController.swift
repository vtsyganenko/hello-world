//
//  ViewController.swift
//  Requests
//
//  Created by Виталий Цыганенко on 12.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let endpointAPI = "api.openweathermap.org"
    let endpoint = "openweathermap.org"
    let latitudeNN = "56.3230"
    let longitudeNN = "43.9427"
    let key = "e3fbcd423ad960e85e3ec1bbdd60c874"

    @IBOutlet var case2ImageView: UIImageView!
    
    @IBOutlet var weatherDescriptionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    
    @IBOutlet var case3ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func case1ButtonTouch() {
        let url = URL(string: "https://\(endpoint)/img/wn/02d@2x.png")!
        NSLog("case 1 has url: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // completionHandler:
            NSLog("handler is called")
            
            print("data type:", type(of:data))
            if let data = data {
                print("data:", data)
            } else {
                print("data is nil")
            }
            
            print("response type:", type(of:response))
            if let response = response {
                print("response:", response)
            } else {
                print("response is nil")
            }
            
            print("error type:", type(of:error))
            if let error = error {
                print("error:", error)
            } else {
                print("error is nil")
            }
            
            print()
        }
        
        // execute HTTP request
        task.resume()
        NSLog("sent request for case 1")
    }
    
    @IBAction func case2ButtonTouch() {
        let url = URL(string: "https://\(endpoint)/img/wn/02d@2x.png")!
        NSLog("case 2 has url: \(url)")
        
        let request = URLRequest(url: url)
        // we can specify request parameters
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // completionHandler:
            NSLog("handler is called")
            
            print("data type:", type(of:data))
            if let data = data {
                print("data:", data)
                
                // put task to main queue since this imageView shoud be modified in main thread
                DispatchQueue.main.async {
                    print("set image")
                    self.case2ImageView.image = UIImage(data:data)
                }
            } else {
                print("data is nil")
            }
            
            print("response type:", type(of:response))
            if let response = response {
                print("response:", response)
            } else {
                print("response is nil")
            }
            
            print("error type:", type(of:error))
            if let error = error {
                print("error:", error)
            } else {
                print("error is nil")
            }
            
            print()
        }
        
        // execute HTTP request
        task.resume()
        NSLog("sent request for case 2")
    }
    
    @IBAction func case2RemoveImageButtonTouch() {
        self.case2ImageView.image = nil
    }
    
    struct WeatherResponse : Decodable {
        struct Coord : Decodable {
            let lon: Double
            let lat: Double
        }
        let coord: Coord
        struct Weather : Decodable {
            let main: String
            let description: String
            let icon: String
        }
        let weather: Array<Weather>
        struct Main : Decodable {
            let temp: Double
        }
        let main: Main
        struct Wind : Decodable {
            let speed: Int
        }
        let wind: Wind
        let name: String
    }
    
    @IBAction func case3ButtonTouch() {
        let url = URL(string: "https://\(endpointAPI)/data/2.5/weather?lat=\(latitudeNN)&lon=\(longitudeNN)&appid=\(key)&units=metric")!
        NSLog("case 3 has url: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // completionHandler:
            NSLog("handler is called")
            
            if let data = data {
                if let weather = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
                    print("weather struct:")
                    print(weather)
                    
                    var weatherDescription: String = "no data"
                    var imageId: String = ""
                    if let weatherData = weather.weather.first {
                        weatherDescription = "\(weatherData.main) (\(weatherData.description))"
                        imageId = weatherData.icon
                    }
                    let temperature = Int(round(weather.main.temp))
                    let windSpeed = weather.wind.speed
                    
                    DispatchQueue.main.async {
                        self.weatherDescriptionLabel.text = weatherDescription
                        self.temperatureLabel.text = "\(temperature) \u{00B0}C" // celsius degrees
                        self.windLabel.text = "\(windSpeed) m/s"
                    }
                    
                    let url = URL(string: "https://\(self.endpoint)/img/wn/\(imageId)@2x.png")!
                    print("image url:", url)
                    
                    let task = URLSession.shared.dataTask(with: url) { data, response, error in
                        // completionHandler:
                        NSLog("handler (image) is called")
                        
                        if let data = data {
                            DispatchQueue.main.async {
                                print("set image")
                                self.case3ImageView.image = UIImage(data:data)
                            }
                        } else {
                            print("data is nil")
                        }
                        
                        if let response = response {
                            print("response:", response)
                        } else {
                            print("response is nil")
                        }

                        if let error = error {
                            print("error:", error)
                        } else {
                            print("error is nil")
                        }
                        
                        print()
                    }
                    
                    // execute HTTP request
                    task.resume()
                    NSLog("sent image request for case 3")
                    
                } else {
                    print("Invalid Response")
                }
            }
            
            if let response = response {
                print("response:", response)
            } else {
                print("response is nil")
            }

            if let error = error {
                print("error:", error)
            } else {
                print("error is nil")
            }
            
            print()
        }
        
        // execute HTTP request
        task.resume()
        NSLog("sent request for case 3")
    }
    
    @IBAction func case3ClearDataButtonTouch() {
        self.weatherDescriptionLabel.text = "Weather"
        self.temperatureLabel.text = "Temperature"
        self.windLabel.text = "Wind"
        self.case3ImageView.image = nil
    }

}

