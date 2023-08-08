//
//  SeperatorView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 7.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class SeperatorView: UIView {

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.systemGray6
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 1),
            self.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
    }
}
