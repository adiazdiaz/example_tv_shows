//
//  TvShowDetailInteractor.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 13/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Alamofire

class TvShowDetailInteractor {
    
    var presenter: TvShowDetailInteractorOutputProtocol?
    var networkManager: NetworkManagerProtocol?
    
    required init(networkManager: NetworkManagerProtocol?, presenter: TvShowDetailInteractorOutputProtocol?) {
        self.networkManager = networkManager
        self.presenter = presenter
    }
}

//MARK: - TvShowDetailInteractorInputProtocol
extension TvShowDetailInteractor: TvShowDetailInteractorInputProtocol {
    
    func getTvShow(tvShowId: Int) {
        networkManager?.getTvShowsDetail(tvShowId: tvShowId) { tvShowDetail, error in
            if error != nil {
                self.presenter?.onGetTvShowError()
            } else {
                self.presenter?.onGetTvShowSuccess(tvShowDetail: tvShowDetail)
            }
        }
    }
}
