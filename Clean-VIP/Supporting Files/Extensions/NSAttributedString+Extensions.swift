//
//  NSAttributedString+Extensions.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 19.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    func withLineSpacing(_ spacing: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
}
