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
    static let theMovieDbAPIKey = Bundle.main.TheMovieDbAPIKey
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum TvShows: Endpoint {
        
        case fetchPopular(Int)
        
        public var path: String {
            switch self {
            case .fetchPopular(let page): return "/tv/popular?api_key=\(API.theMovieDbAPIKey)&page=\(page)"
            }
        }
        
        public var url: String {
            switch self {
            case .fetchPopular: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
