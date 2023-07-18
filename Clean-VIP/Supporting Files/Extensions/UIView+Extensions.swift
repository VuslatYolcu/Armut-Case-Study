//
//  UIView+Extensions.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 19.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

extension UIView {
    
    func addFadingEffect(width: CGFloat, height: CGFloat) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1.25]
        self.layer.insertSublayer(gradient, at: 1)
        
    }
}
