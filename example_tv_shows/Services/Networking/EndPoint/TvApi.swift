//
//  MovieApi.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 30/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case production
    //case qa, test, pre
}

public enum TvApi {
    case popular(page: Int)
    case detail(id: Int)
}

extension TvApi: EndPointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
            case .production: return "https://api.themoviedb.org/3/tv/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
            case .popular: return "popular"
            case .detail(let id): return "\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .popular(let page):
            return .requestParameters(bodyParameters: nil, urlParameters: ["page":page,
                                                                           "api_key": NetworkManager.TvAPIKey])
        default:
            return .requestParameters(bodyParameters: nil, urlParameters: ["api_key": NetworkManager.TvAPIKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
