//
//  UIImageViewExtension.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 12/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadFromUrl(url: URL, completion: @escaping ((UIImage) -> Void)) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion(image)
                    }
                }
            }
        }
    }
}
