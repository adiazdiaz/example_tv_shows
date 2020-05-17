//
//  TvShowDetail.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 16/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

struct TvShowDetail: Codable {
    let id: Int
    let name: String?
    let posterPath: String?
    let overview: String?

    enum CodingKeys: String, CodingKey {
        case id, name, overview
        case posterPath = "poster_path"
    }
    
    func getCompletePosterPath() -> String {
        return "\(Bundle.main.theMovieDbImagesPath)\(posterPath ?? "")"
    }
}
