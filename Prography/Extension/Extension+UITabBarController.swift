//
//  TabBarViewController.swift
//  prography
//
//  Created by 김수경 on 2024/01/30.
//

import UIKit


extension UITabBarController {
    convenience init(controllers: [UIViewController], images: [UIImage]) {
        self.init()
        
        let maxCount = controllers.count <= images.count ? controllers.count : images.count
        
        self.setViewControllers(controllers, animated: true)
        if let items = self.tabBar.items {
            for i in 0..<maxCount {
                items[i].image = images[i]
            }
        }
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = UIColor(resource: .gray60)
        tabBar.backgroundColor = UIColor(resource: .black90)
    }
}
