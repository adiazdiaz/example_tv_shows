//
//  PopularTvShowsListRemoteDataManager.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Alamofire

class PopularTvShowsListRemoteDataManager {
    
    var remoteRequestHandler: PopularTvShowsListRemoteDataManagerOutputProtocol?
    var networkManager: NetworkManagerProtocol?
    
    required init(networkManager: NetworkManagerProtocol?, remoteRequestHandler: PopularTvShowsListRemoteDataManagerOutputProtocol?) {
        self.networkManager = networkManager
        self.remoteRequestHandler = remoteRequestHandler
    }
}

//MARK: - TvShowsListRemoteDataManagerInputProtocol
extension PopularTvShowsListRemoteDataManager: PopularTvShowsListRemoteDataManagerInputProtocol {
    
    func getPopularTvShows(page: Int) {
        networkManager?.getPopularTvShows(page: 1) { popularTvShowsResponse, error in
            if error != nil {
                self.remoteRequestHandler?.onGetPopularTvShowsError()
            } else {
                self.remoteRequestHandler?.onGetPopularTvShowsSuccess(popularTvShowsResponse: popularTvShowsResponse)
            }
        }
    }
}
