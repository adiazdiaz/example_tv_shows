//
//  BundleExtension.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

extension Bundle {
    
    var theMovieDbAPIKey: String {
        return object(forInfoDictionaryKey: "TheMovieDbAPIKey") as? String ?? ""
    }
    
    var theMovieDbImagesPathThumbnail: String {
        return object(forInfoDictionaryKey: "TheMovieDbImagesPathThumbnail") as? String ?? ""
    }
    
    var theMovieDbImagesPath: String {
        return object(forInfoDictionaryKey: "TheMovieDbImagesPath") as? String ?? ""
    }
}
