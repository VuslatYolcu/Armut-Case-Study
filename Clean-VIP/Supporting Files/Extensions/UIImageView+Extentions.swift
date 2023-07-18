//
//  UIImageView+Extentions.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//
import UIKit

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func addFadingEffect() {
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func makeGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.contents = self.image?.cgImage
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        self.layer.addSublayer(gradient)
    }

}

extension UIView{
   // For insert layer in Foreground
   func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.addSublayer(gradient)
   }
   // For insert layer in background
   func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
   }
}
