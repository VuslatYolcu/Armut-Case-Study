//
//  SeperatorView.swift
//  Clean-VIP
//
//  Created by Vuslat Yolcu on 7.08.2023.
//  Copyright © 2023 Zafar. All rights reserved.
//

import UIKit

final class SeperatorView: UIView {

    private var height: Int
    
    // MARK: - Init
    init(frame: CGRect, height: Int) {
        self.height = height
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemGray6
        self.addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            self.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
    }
}
