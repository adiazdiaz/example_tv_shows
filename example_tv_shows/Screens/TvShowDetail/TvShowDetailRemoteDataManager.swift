//
//  TvShowDetailRemoteDataManager.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 13/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Alamofire

class TvShowDetailRemoteDataManager {
    
    var remoteRequestHandler: TvShowDetailRemoteDataManagerOutputProtocol?
    var networkManager: NetworkManagerProtocol?
    
    required init(networkManager: NetworkManagerProtocol?, remoteRequestHandler: TvShowDetailRemoteDataManagerOutputProtocol?) {
        self.networkManager = networkManager
        self.remoteRequestHandler = remoteRequestHandler
    }
}

//MARK: - TvShowDetailRemoteDataManagerInputProtocol
extension TvShowDetailRemoteDataManager: TvShowDetailRemoteDataManagerInputProtocol {
    
    func getTvShow(tvShowId: Int) {
        networkManager?.getTvShowsDetail(tvShowId: tvShowId) { tvShowDetail, error in
            if error != nil {
                self.remoteRequestHandler?.onGetTvShowError()
            } else {
                self.remoteRequestHandler?.onGetTvShowSuccess(tvShowDetail: tvShowDetail)
            }
        }
    }
}
