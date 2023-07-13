//
//  AllServicesViewModel.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 13.07.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

struct AllServicesViewModel {
    let titleLabel: String
    let serviceList: [AllServicesCollectionViewCellModel]
}

struct AllServicesCollectionViewCellModel {
    let label: String
    let imageName: String
}
