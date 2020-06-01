//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Jerry Gordillo on 13/05/20.
//  Copyright © 2020 JerriodasCorp. All rights reserved.
//

import Foundation

struct CurrentWeatherModel: Decodable {
    var coordinates: Coordinates?
    var weather: [WeatherConditions]?
    var base: String?
    var mainWeather: Weather?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var timeData: Int?
    var system: WeatherSystem?
    var timeZone: Int?
    var id: Int?
    var name: String?
    var code: Int?
    
    private enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather = "weather"
        case base = "base"
        case mainWeather = "main"
        case visibility = "visibility"
        case wind = "wind"
        case clouds = "clouds"
        case timeData = "dt"
        case system = "sys"
        case timeZone = "timezone"
        case id = "id"
        case name = "name"
        case code = "code"
    }
}

struct Coordinates: Decodable {
    var longitude: Double?
    var latitude: Double?
    
    private enum CodingKeys: String, CodingKey {
        case longitude = "lat"
        case latitude = "lon"
    }
}

struct WeatherConditions: Decodable {
    var weatherID: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    private enum CodingKeys: String, CodingKey {
        case weatherID = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}

struct Weather: Decodable {
    var temperature: Double?
    var feels: Double?
    var minTemp: Double?
    var maxTemp: Double?
    var pressure: Double?
    var humidity: Double?
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feels = "feels_like"
        case minTemp   = "temp_min"
        case maxTemp   = "temp_max"
        case pressure  = "pressure"
        case humidity  = "humidity"
    }
}

struct Wind: Decodable {
    var speed: Double?
    var direction: Double?
    
    private enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case direction = "deg"
    }
}

struct Clouds: Decodable {
    var all: Int?
    
    private enum CodingKeys: String, CodingKey {
        case all = "all"
    }
}

struct WeatherSystem: Decodable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    
    private enum CodingKeys: String, CodingKey {
        case type     = "type"
        case id       = "id"
        case country  = "country"
        case sunrise  = "sunrise"
        case sunset   = "sunset"
    }
}
