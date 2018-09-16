//
//  Extensions.swift
//  LoginReactiveStarter
//
//  Created by Brian Voong on 7/5/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

extension UIColor {
    static let mainBlue = UIColor.rgb(r: 0, g: 119, b: 245)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

extension UIViewController {
    func setupGradient() {
        let gradientLayer = CAGradientLayer()
        let topColor = UIColor.rgb(r: 68, g: 80, b: 95).cgColor
        let bottomColor = UIColor.rgb(r: 49, g: 60, b: 76).cgColor
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations = [0, 1]
        
        view.layer.addSublayer(gradientLayer)
        gradientLayer.frame = view.bounds
    }
}
