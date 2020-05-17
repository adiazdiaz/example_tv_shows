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
}

//MARK: - TvShowDetailRemoteDataManagerInputProtocol
extension TvShowDetailRemoteDataManager: TvShowDetailRemoteDataManagerInputProtocol {
    
    func getTvShow(tvShowId: Int) {
        AF.request(Endpoints.TvShows.getTvShow(tvShowId).url, method: .get)
        .validate()
        .responseDecodable(of: TvShowDetail.self) { (response) in
            switch response.result {
                case .success(let tvShowDetail): self.remoteRequestHandler?.onGetTvShowSuccess(tvShowDetail: tvShowDetail)
                case .failure(_): self.remoteRequestHandler?.onGetTvShowError()
            }
        }
    }
}
