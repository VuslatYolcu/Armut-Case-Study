//
//  ServiceDetailsResponseModel.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 3.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

// MARK: - Service Details Response Model

struct ServiceDetailsResponseModel: Codable {
    let id: Int?
    let serviceID: Int?
    let name: String?
    let longName: String?
    let imageURL: String?
    let proCount: Int?
    let averageRating: Double?
    let completedJobsOnLastMonth: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case serviceID = "service_id"
        case name = "name"
        case longName = "long_name"
        case imageURL = "image_url"
        case proCount = "pro_count"
        case averageRating = "average_rating"
        case completedJobsOnLastMonth = "completed_jobs_on_last_month"
    }
}

