//
//  UINavigationBarExtension.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 16/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func clearNavigationBar() {
        self.setBackgroundImage(UIImage(), for:.default)
        self.isTranslucent = true
        self.shadowImage = UIImage()
    }
}
