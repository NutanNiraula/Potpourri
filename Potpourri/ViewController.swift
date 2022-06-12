//
//  ViewController.swift
//  Potpourri
//
//  Created by Nutan Niraula on 10/6/2565 BE.
//

import UIKit
import SwiftUI

class ViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let tabOne = UIKitViewController()
        let tabOneBarItem = UITabBarItem(title: "UIKit", image: UIImage(systemName: "slider.vertical.3"), tag: 0)
        tabOne.tabBarItem = tabOneBarItem
        
        let tabTwo = UIHostingController(rootView: MainSwiftUIView())
        let tabTwoBarItem2 = UITabBarItem(title: "SwiftUI", image: UIImage(systemName: "paintbrush.pointed"), tag: 1)
        tabTwo.tabBarItem = tabTwoBarItem2
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.tabBarItem.tag)")
    }
}

