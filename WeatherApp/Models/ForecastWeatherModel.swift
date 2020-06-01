//
//  ForecastWeatherModel.swift
//  WeatherApp
//
//  Created by Jerry Gordillo on 31/05/20.
//  Copyright © 2020 JerriodasCorp. All rights reserved.
//

import Foundation

struct ForecastWeatherModel: Decodable {
    var responseCode: String?
    var message: Int?
    var count: Int?
    var list: [List]?
    var city: City?
    
    private enum ForecastKeys: String, CodingKey {
        case responseCode = "cod"
        case message = "message"
        case count = "cnt"
        case list = "list"
        case city = "city"
    }
}

struct City: Decodable {
    var id: Int?
    var name: String?
    var coordinates: Coordinates?
    var country: String?
    var population: Int?
    var timeZone: Int?
    var sunRise: Int?
    var sunSet: Int?
    
    private enum CityKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case coordinates = "coord"
        case country = "country"
        case population = "population"
        case timeZone = "timezone"
        case sunRise = "sunrise"
        case sunSet = "sunset"
    }
}

struct List: Decodable {
    var timeOfData: Int?
    var mainInfoWeather: MainWeather?
    var weather: [WeatherConditions]?
    var clouds: Clouds?
    var wind: Wind?
    var rain: VolumeForecast?
    var snow: VolumeForecast?
    var sys: SysForecast?
    var timeForecast: Date?
    
    private enum ListKeys: String, CodingKey {
        case timeOfData = "dt"
        case mainInfoWeather = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case rain = "rain"
        case snow = "snow"
        case sys = "sys"
        case timeForecast = "dt_txt"
    }
}

struct MainWeather: Decodable {
    var temperature: Double?
    var feels: Double?
    var minTemp: Double?
    var maxTemp: Double?
    var pressure: Double?
    var seaLevel: Double?
    var groundLevel: Double?
    var humidity: Double?
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feels = "feels_like"
        case minTemp   = "temp_min"
        case maxTemp   = "temp_max"
        case pressure  = "pressure"
        case seaLevel  = "sea_level"
        case groundLevel  = "grnd_level"
        case humidity  = "humidity"
    }
}

struct VolumeForecast: Decodable {
    var volume: Double?
    
    private enum VolumeForecastKeys: String, CodingKey {
        case volume = "3h"
    }
}

struct SysForecast: Decodable {
    var pod: String?
    private enum SysKeys: String, CodingKey {
        case pod = "pod"
    }
}
