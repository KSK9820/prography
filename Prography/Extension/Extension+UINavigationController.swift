//
//  Extension+UINavigationController.swift
//  prography
//
//  Created by 김수경 on 2024/01/30.
//

import UIKit

extension UINavigationController {
    convenience init(controller: UIViewController) {
        self.init(rootViewController: controller)
        
        self.navigationBar.topItem?.titleView = UIImageView(image: UIImage(resource: .logo))
        self.navigationBar.backgroundColor = .white
        self.navigationBar.isHidden = false
        self.navigationBar.isTranslucent = false
    }
}
