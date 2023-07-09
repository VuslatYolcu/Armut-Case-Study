//
//  UISearchBar+Helper.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 9.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

extension UISearchBar {
    /** An easy way to set the magnifying glass color in interface builder
    It is recommended to set this in interface Builder,
    However if you want to do it programatically you can do it like this:
    ```
    let searchBar = UISearchBar()
    searchBar.magnifyingGlassColor = UIColor.red
    ```
    */
//    @IBInspectable var magnifyingGlassColor: UIColor {
//        get {
//            return getSearchBarLeftViewImageView()?.tintColor ?? UIColor()
//        }
//        set {
//            if let imageView = getSearchBarLeftViewImageView(),
//                let image = imageView.image
//            {
//                let coloredImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
//                imageView.image = coloredImage
//                imageView.tintColor = newValue
//            }
//        }
//    }
//    
//    func getSearchBarLeftViewImageView() -> UIImageView? {
//        for i in self.subviews.first!.subviews {
//            if let textField = i as? UITextField,
//                let imageView = textField.leftView as? UIImageView
//            {
//                return imageView
//            }
//        }
//        return nil
//    }
    
}
