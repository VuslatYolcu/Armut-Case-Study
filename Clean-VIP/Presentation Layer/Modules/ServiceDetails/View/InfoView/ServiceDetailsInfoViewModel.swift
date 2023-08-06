//
//  ServiceDetailsInfoViewModel.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 6.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

struct ServiceDetailsInfoViewModel {
    let imageName: String?
    let label: String
    let type: ServiceDetailsInfoType
}

enum ServiceDetailsInfoType: String, CodingKey {
    case professionals = "{0} pros near you"
    case rating = "{0} average rating"
    case completedJobs = "Last month {0} cleaning job completed"
    case charge = "Free of charge"
    case serviceGuaranteed = "Service Guaranteed"
}

