//
//  String+Extensions.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

extension String {
    func formatString(input: String) -> String? {
        guard input.count >= 3 else {
            return nil
        }
        let index = input.index(input.endIndex, offsetBy: -3)
        var formattedString = input
        formattedString.insert(".", at: index)
        return formattedString
    }
}
