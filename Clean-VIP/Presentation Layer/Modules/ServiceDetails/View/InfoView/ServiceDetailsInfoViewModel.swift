//
//  ServiceDetailsInfoViewModel.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

struct ServiceDetailsInfoViewModel {
    let label: String
    let imageName: String
}

enum ServiceDetailsInfoType: String, CodingKey {
    case professionals
    case rating
    case completedJobs
    case freeCharge
    case serviceGuaranteed
    
    var info: (text: String, imageName: String) {
        switch self {
        case .professionals:
            return ("%@ pros near you", "professional")
        case .rating:
            return ("%@ average rating", "star")
        case .completedJobs:
            return ("Last month %@ cleaning job completed", "completedJob")
        case .freeCharge:
            return ("Free of charge", "freeCharge")
        case .serviceGuaranteed:
            return ("Service Guaranteed", "serviceGuaranteed")
        }
    }
}

