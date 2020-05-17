//
//  TvShows.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

struct TvShowsResponse: Codable {
    let page: Int?
    let results: [TvShow]?
    let totalResults: Int?
    let totalPages: Int?
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
