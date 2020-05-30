//
//  PopularTvShowsListInteractor.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Alamofire

class PopularTvShowsListInteractor {
    
    var presenter: PopularTvShowsListInteractorOutputProtocol?
    var networkManager: NetworkManagerProtocol?
    
    required init(networkManager: NetworkManagerProtocol?, presenter: PopularTvShowsListInteractorOutputProtocol?) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
}

//MARK: - PopularTvShowsListInteractorInputProtocol
extension PopularTvShowsListInteractor: PopularTvShowsListInteractorInputProtocol {
    
    func getPopularTvShows(page: Int) {
        networkManager?.getPopularTvShows(page: 1) { popularTvShowsResponse, error in
            if error != nil {
                self.presenter?.onGetPopularTvShowsError()
            } else {
                self.presenter?.onGetPopularTvShowsSuccess(popularTvShowsResponse: popularTvShowsResponse)
            }
        }
    }
}
