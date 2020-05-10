//
//  TvShowsListRemoteDataManager.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation
import Alamofire

class TvShowsListRemoteDataManager {
    
    var remoteRequestHandler: TvShowsListRemoteDataManagerOutputProtocol?

}

extension TvShowsListRemoteDataManager: TvShowsListRemoteDataManagerInputProtocol {
    
    func getTvShows(page: Int) {
        AF.request(Endpoints.TvShows.fetchPopular(page).url, method: .get)
            .validate()
            .responseDecodable(of: TvShowsResponse.self) { (response) in
                switch response.result {
                    case .success(let tvShowsResponse): self.remoteRequestHandler?.onGetTvShowsSuccess(tvShowsResponse: tvShowsResponse)
                    case .failure(_): self.remoteRequestHandler?.onGetTvShowsError()
                }
            }
    }
}
