//
//  UIViewExtension.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 16/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
