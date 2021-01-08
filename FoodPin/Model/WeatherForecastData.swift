//
//  WeatherForecastData.swift
//  RestUp
//
//  Created by WiseLab-Mac-2014 on 2021/1/8.
//  Copyright © 2021 NDHU_CSIE. All rights reserved.
//

import Foundation

struct WeatherForecastData: Codable {
    var name: String
    var coord: Coord
    var main: Main
    var weather: [Weather]
}

struct Coord: Codable {
    var lon: Double
    var lat: Double
}

struct Main: Codable {
    var temp: Double
    var humidity: Int
    var temp_min: Double
    var temp_max: Double
}

struct Weather: Codable {
    var main: String
    var description: String
    var icon: String
}
