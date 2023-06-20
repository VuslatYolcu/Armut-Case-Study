//
//  ServicesViewController.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 20.06.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

protocol ServicesPresenterOutput: AnyObject {
    func presenter(didRetrieveItem item: String)
    func presenter(didFailRetrieveItem message: String)
}

class ServicesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = titleDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Properties
    var titleDetailView: TitleDetailView?
    var interactor: TitleDetailInteractor?
    weak var presenter: TitleDetailPresenter?
    var router: TitleDetailRouter?
    
}
//
//// MARK: - Presenter Output
//extension TitleDetailViewController: TitleDetailPresenterOutput {
//    func presenter(didRetrieveItem item: String) {
//        titleDetailView?.updateLabel(with: item)
//    }
//
//    func presenter(didFailRetrieveItem message: String) {
//        showError(with: message)
//    }
//}
