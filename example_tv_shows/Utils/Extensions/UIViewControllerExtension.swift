//
//  UIViewControllerExtension.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 13/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var activityIndicatorTag: Int { return 8888 }
    
    func startActivityIndicator() {
        DispatchQueue.main.async {
            let backgroundView = UIView(frame: self.view.bounds)
            backgroundView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            backgroundView.tag = self.activityIndicatorTag
            self.view.addSubview(backgroundView)
            
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = UIColor.black
            activityIndicator.center = backgroundView.center
            activityIndicator.startAnimating()
            backgroundView.addSubview(activityIndicator)
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            self.view.subviews.filter({ $0.tag == self.activityIndicatorTag }).first?.removeFromSuperview()
        }
    }
    
}
