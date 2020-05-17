//
//  ImagesCache.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 17/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

class ImagesCache {
    private var loadedImages = [URL: UIImage]()
    
    func getImageLoaded(imageUrl: URL) -> UIImage? {
        return loadedImages[imageUrl]
    }
    
    func addImageToImagesLoaded(imageUrl: URL, image: UIImage) {
        loadedImages[imageUrl] = image
    }
    
    func clearImagesLoaded() {
        loadedImages.removeAll()
    }
}
