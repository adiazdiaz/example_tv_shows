//
//  TvShowsRemoteDataManager.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation
import Alamofire

class TvShowsListRemoteDataManager {
    
}

extension TvShowsListRemoteDataManager: TvShowsListRemoteDataManagerInputProtocol {
    
    func getTvShows() {
        AF.request(Endpoints.TvShows.fetchPopular.url, method: .get).responseJSON { (data) in
            print(data)
        }
    }
    
    
}
