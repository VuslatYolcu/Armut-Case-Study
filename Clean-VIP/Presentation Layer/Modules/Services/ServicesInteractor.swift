//
//  ServicesInteractor.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import Foundation

protocol ServicesInteractor: AnyObject {
    
    func viewDidLoad()
}

final class ServicesInteractorImplementation: ServicesInteractor {
    
    var presenter: ServicesPresenter?
    
    //private let titlesService = TitlesServiceImplementation()
    
    func viewDidLoad() {
        
    }
}
