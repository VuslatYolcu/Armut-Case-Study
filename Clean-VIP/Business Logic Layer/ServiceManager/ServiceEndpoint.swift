//
//  ServiceEndpoint.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

/// Represents unique API call
@frozen enum ServiceEndpoint: String, CaseIterable, Hashable {
    
    case home
    case service
}
