//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jerry Gordillo on 13/05/20.
//  Copyright © 2020 JerriodasCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Temperature Label
    var templabel = Controls.theLabel(title: "", fontSize: 130, fontColor: .black)
    
    //Degree Label
    var degreelabel = Controls.theLabel(title: "", fontSize: 60, fontColor: .black)
    
    //Weather Description Label
    var weatherDesclabel = Controls.theLabel(title: "", fontSize: 20, fontColor: .black)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeTempLabel()
        makeDegLabel()
        makeWeatherDescLabel()
        let url = Constants.baseURL + "lat=\(Constants.lat)&lon=\(Constants.lng)&units=metric&lang=sp&appid=\(Constants.weatherAPIKey)"
        getData(from: url)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //Make Temperature Label
    private func makeTempLabel(){
        view.addSubview(templabel)
        templabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        templabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    //Make Degree Label
    private func makeDegLabel(){
        view.addSubview(degreelabel)
        degreelabel.leadingAnchor.constraint(equalTo: templabel.trailingAnchor, constant: 2).isActive = true
        degreelabel.topAnchor.constraint(equalTo: templabel.topAnchor, constant: 0).isActive = true
        
    }
    
    //Make Weather Descripition Label
    private func makeWeatherDescLabel(){
        view.addSubview(weatherDesclabel)
        weatherDesclabel.topAnchor.constraint(equalTo: templabel.bottomAnchor, constant: 10).isActive = true
        weatherDesclabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    private func getData(from url: String) {
        SmartRESTHelper.getWeatherData(url: url) { (response: CurrentWeatherModel, error) in
            if error != nil {
                print("An error occurred: ", error!.localizedDescription)
            } else {
                print(response)
                
                guard let temp = response.mainWeather?.temperature, let desc = response.weather?.first?.description else { return }
                
                DispatchQueue.main.async {
                    self.templabel.text = "\(Int(temp))"
                    self.degreelabel.text = "°C"
                    self.weatherDesclabel.text = desc
                }
            }
        }
    }
}

