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
    
    required init(remoteRequestHandler: PopularTvShowsListRemoteDataManagerOutputProtocol?) {
        self.remoteRequestHandler = remoteRequestHandler
    }
}

//MARK: - TvShowsListRemoteDataManagerInputProtocol
extension PopularTvShowsListRemoteDataManager: PopularTvShowsListRemoteDataManagerInputProtocol {
    
    func getPopularTvShows(page: Int) {
        AF.request(Endpoints.TvShows.getPopularTvShows(page).url, method: .get)
            .validate()
            .responseDecodable(of: TvShowsResponse.self) { (response) in
                switch response.result {
                    case .success(let tvShowsResponse): self.remoteRequestHandler?.onGetPopularTvShowsSuccess(popularTvShowsResponse: tvShowsResponse)
                    case .failure(_): self.remoteRequestHandler?.onGetPopularTvShowsError()
                }
            }
    }
}
