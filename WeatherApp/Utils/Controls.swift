//
//  Controls.swift
//  WeatherApp
//
//  Created by Jerry Gordillo on 31/05/20.
//  Copyright © 2020 JerriodasCorp. All rights reserved.
//

import UIKit

class Controls {
    // MARK:- CREATING LABEL
    static func theLabel(title: String, fontSize: CGFloat, fontColor: UIColor) -> UILabel {
        
        let label: UILabel = {
            
            let lb = UILabel()
            lb.translatesAutoresizingMaskIntoConstraints = false
            lb.font = lb.font.withSize(fontSize)
            lb.textColor = fontColor
            lb.text = title
            
            return lb
        }()
        
        return label
    }
}
