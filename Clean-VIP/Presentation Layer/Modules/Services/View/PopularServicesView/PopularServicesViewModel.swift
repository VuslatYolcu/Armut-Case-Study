//
//  PopularServicesViewModel.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 16.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

struct PopularServicesViewModel {
    let titleLabel: String
    let serviceList: [PopularServicesCollectionViewCellModel]
}

struct PopularServicesCollectionViewCellModel {
    let label: String
    let imageUrl: String
}

