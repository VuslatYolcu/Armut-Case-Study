//
//  ServicesResponseModel.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

// MARK: - ServicesResponseModel
struct ServicesResponseModel: Codable {
    let allServices: [ServiceModel]
    let popularServices: [ServiceModel]
    let posts: [BlogPostModel]

    enum CodingKeys: String, CodingKey {
        case allServices = "all_services"
        case popularServices = "popular"
        case posts
    }
}

// MARK: - Service Model
struct ServiceModel: Codable {
    let id: Int?
    let serviceId: Int?
    let name: String
    let longName: String
    let imageURL: String?
    let proCount: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case serviceId = "service_id"
        case name = "name"
        case longName = "long_name"
        case imageURL = "image_url"
        case proCount = "pro_count"
    }
}

// MARK: - Post
struct BlogPostModel: Codable {
    let title: String
    let category: String
    let imageURL: String?
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case category
        case imageURL = "image_url"
        case link
    }
}

