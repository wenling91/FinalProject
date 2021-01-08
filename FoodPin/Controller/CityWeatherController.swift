//
//  CityWeatherController.swift
//  RestUp
//
//  Created by WiseLab-Mac-2014 on 2021/1/8.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import UIKit

class CityWeatherController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cities = [
     (eName:"Hualien City",cName:"花蓮市"),
     (eName:"Xincheng",cName:"新城鄉"),
     (eName:"Ji'an",cName:"吉安鄉"),
     (eName:"Shoufeng",cName:"壽豐鄉"),
     (eName:"Guangfu",cName:"光復鄉"),
     (eName:"Fengbin",cName:"豐濱鄉"),
     (eName:"Ruisui",cName:"瑞穗鄉"),
     (eName:"Fuli",cName:"富里鄉")
     ]
     
     private let API_URL = "https://api.openweathermap.org/data/2.5/weather?"
     private let ICON_URL = "https://openweathermap.org/img/wn/"
     private let API_KEY = "rC8Itx7cCOYBAbVCwVAgcqFI14ThXRrX"
     
     @IBOutlet var cityName: UILabel!
     @IBOutlet var weatherState: UILabel!
     @IBOutlet var weatherIcon: UIImageView!

     override func viewDidLoad() {
         super.viewDidLoad()

         // Do any additional setup after loading the view.
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return cities.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "datacell", for: indexPath)

         // Configure the cell...
         cell.textLabel?.text = cities[indexPath.row].cName
         cell.detailTextLabel?.text = cities[indexPath.row].eName
         

         return cell
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         getForecast(location: cities[indexPath.row].eName)
     }
     
     func getForecast(location: String) {
         
         guard let accessURL = URL(string: API_URL + "q=\(location)&units=metric&lang=zh_tw&appid=\(API_KEY)") else {
             return
         }
         
         let request = URLRequest(url: accessURL)
         let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
             if let error = error {
                 print(error)
                 return
             }
             //parse data
             if let data = data {
                 let decoder = JSONDecoder()
                 if let weatherData = try? decoder.decode(WeatherForecastData.self, from: data) {
                     //download weahter icon
                     self.getImage(weatherCode: weatherData.weather[0].icon)
                     OperationQueue.main.addOperation {
                         self.cityName.text = weatherData.name
                         self.weatherState.text = weatherData.weather[0].description
                     }
                 }
             }
         })
         
         task.resume()
     }
     
     
     func getImage(weatherCode: String) {
         
         guard let accessURL = URL(string: ICON_URL + "\(weatherCode)@2x.png") else {
             return
         }
         
         let request = URLRequest(url: accessURL)
         let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
             if let error = error {
                 print(error)
                 return
             }
             //parse data
             if let data = data, let image = UIImage(data: data) {
                 OperationQueue.main.addOperation {
                     self.weatherIcon.image = image
                 }
             }
         })
         
         task.resume()
     }
    

}
