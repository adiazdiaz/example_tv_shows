//
//  TvShow.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

struct TvShow: Codable {
    let id: Int
    let name: String?
    let posterPath: String?
    
    private enum CodingKeys: String, CodingKey {
        case id, name
        case posterPath = "poster_path"
    }
    
    func getCompleteThumbnailPosterPath() -> String {
        return "\(Bundle.main.theMovieDbImagesPathThumbnail)\(posterPath ?? "")"
    }
    
}
