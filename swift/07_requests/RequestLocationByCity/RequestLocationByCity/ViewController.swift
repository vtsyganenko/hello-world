//
//  ViewController.swift
//  RequestLocationByCity
//
//  Created by Виталий Цыганенко on 21.04.2024.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var lattitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    @IBOutlet weak var flagImageView: UIImageView!
    
    var isErrorInput = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
        
        flagImageView.layer.borderColor = UIColor.black.cgColor
        flagImageView.layer.masksToBounds = true
        flagImageView.contentMode = .scaleToFill
        flagImageView.layer.borderWidth = 0.25
    }
    
    func verifySearch(_ str:String) -> Bool {
        let charset : Set<Character> = ["&", ",", "#", "%"]
        return charset.isDisjoint(with: str)
    }
    
    func markSearchStatus(isError error:Bool) {
        isErrorInput = error
        if error { searchBar.backgroundColor = .red }
        else { searchBar.backgroundColor = nil }
    }

    func requestCityLocationBy(searchString search:String) {
        
        guard verifySearch(search) else {
            print("search string \(search) is not acceptable")
            markSearchStatus(isError:true)
            return
        }
        
        markSearchStatus(isError:false)
        
        let endpoint = "https://api.openweathermap.org"
        let key = "e3fbcd423ad960e85e3ec1bbdd60c874"
        let urlString = String(format: "\(endpoint)/geo/1.0/direct?q=\(search)&appid=\(key)")
        
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { [weak self] data, response, error in
            print("geo response handler")
            
            if let error = error {
                print("geo response error:", error)
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! [[String : Any]] // treat as array
                    
                    print(json)
                    if json.isEmpty {
                        DispatchQueue.main.async {
                            self?.cityLabel.text = "City"
                            self?.regionLabel.text = "Region"
                            self?.countryLabel.text = "CC"
                            self?.lattitudeLabel.text = "Lat"
                            self?.longitudeLabel.text = "Lon"
                            self?.flagImageView.image = nil
                        }
                        return
                    }
                    
                    // take first element from array
                    if let info = json.first {
                        
                        var city : String?
                        var region : String?
                        var countryCode : String?
                        var lattitude : Double?
                        var longitude : Double?
                        
                        if let name = info["name"] { city = name as? String }
                        if let state = info["state"] { region = state as? String }
                        if let country = info["country"] { countryCode = country as? String }
                        if let lat = info["lat"] { lattitude = lat as? Double }
                        if let lon = info["lon"] { longitude = lon as? Double }
                        
                        DispatchQueue.main.async {
                            self?.cityLabel.text = city
                            self?.regionLabel.text = region
                            self?.countryLabel.text = countryCode
                            self?.lattitudeLabel.text = String(format: "%.3f", lattitude!)
                            self?.longitudeLabel.text = String(format: "%.3f", longitude!)
                        }
                        
                        if countryCode != nil {
                            self?.requestFlagImageByCountryCode(code: countryCode!)
                        }
                    }
                    
                } catch let jsonError {
                    print("error while parsing json:", jsonError)
                }
            } else {
                print("geo data is empty")
            }
        }
          
        task.resume()
    }
    
    func requestFlagImageByCountryCode(code:String) {
        let urlString = "https://flagsapi.com/\(code)/flat/64.png"
        
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { [weak self] data, response, error in
            print("flag response handler")
            
            if let error = error {
                print("flag response error:", error)
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    self?.flagImageView.image = UIImage(data: data)
                }
            } else {
                print("flag data is empty")
            }
        }
          
        task.resume()
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text != nil else {
            print("search text is nil!")
            return
        }
        
        guard searchBar.text != "" else {
            print("search text is empty!")
            return
        }
        
        requestCityLocationBy(searchString: searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if isErrorInput && verifySearch(searchText) {
            markSearchStatus(isError: false)
        }
    }
}
