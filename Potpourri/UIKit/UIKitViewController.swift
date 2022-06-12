//
//  UIKitViewController.swift
//  Potpourri
//
//  Created by Nutan Niraula on 12/6/2565 BE.
//

import UIKit
import SnapKit

class UIKitViewController: UIViewController {
    
    var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        titleLabel.text = "UIKit"
    }

}
