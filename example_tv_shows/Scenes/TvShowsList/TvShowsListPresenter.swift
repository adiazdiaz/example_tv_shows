//
//  TvShowsListPresenter.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 09/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

class TvShowsListPresenter {
    
    var view: TvShowsListViewProtocol?
    var remoteDataManager: TvShowsListRemoteDataManagerInputProtocol?
    var wireFrame: TvShowsListWireFrameProtocol?
    
    var tvShows = [TvShow]()
}

extension TvShowsListPresenter: TvShowsListPresenterProtocol {
    
    func onViewDidLoad() {
        view?.showActivityIndicator()
        getTvShows()
    }
    
    private func getTvShows() {
        remoteDataManager?.getTvShows(page: 1)
    }
}

extension TvShowsListPresenter: TvShowsListRemoteDataManagerOutputProtocol {
    
    func onGetTvShowsSuccess(tvShowsResponse: TvShowsResponse?) {
        if let newTvShows = tvShowsResponse?.results, !newTvShows.isEmpty {
            self.tvShows.append(contentsOf: newTvShows)
            view?.loadTvShows(tvShows: self.tvShows)
        } else {
            view?.loadEmpty()
        }
    }
    
    func onGetTvShowsError() {
        view?.showError()
    }
    
    
}
