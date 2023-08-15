//
//  String+Extensions.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /// Multiple Language Support
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
    
    func formatString(input: String) -> String? {
        guard input.count >= 3 else {
            return nil
        }
        let index = input.index(input.endIndex, offsetBy: -3)
        var formattedString = input
        formattedString.insert(".", at: index)
        return formattedString
    }
    
    func attributedStringWithColorAndFont(coloredText: String, color: UIColor, font: UIFont) -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: color
        ]

        let attributedString = NSMutableAttributedString(string: self)
        let range = (self as NSString).range(of: coloredText)
        attributedString.setAttributes(attributes, range: range)
        return attributedString
    }
}
