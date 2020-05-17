//
//  Endpoints.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let theMovieDbAPIKey = "api_key=\(Bundle.main.theMovieDbAPIKey)"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum TvShows: Endpoint {
        
        case getPopularTvShows(Int)
        case getTvShow(Int)
        
        public var path: String {
            switch self {
            case .getPopularTvShows(let page): return "/tv/popular?\(API.theMovieDbAPIKey)&page=\(page)"
            case .getTvShow(let tvShowId): return "/tv/\(tvShowId)?\(API.theMovieDbAPIKey)"
            }
        }
        
        public var url: String {
            return "\(API.baseUrl)\(path)"
        }
    }
}
