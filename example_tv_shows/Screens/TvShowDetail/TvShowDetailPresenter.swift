//
//  TvShowDetailPresenter.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 13/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation


class TvShowDetailPresenter {
    
    var view: TvShowDetailViewProtocol?
    var remoteDataManager: TvShowDetailRemoteDataManagerInputProtocol?
    var wireFrame: TvShowDetailWireFrameProtocol?
    
    var tvShowId: Int?
    
    required init(view: TvShowDetailViewProtocol?, wireFrame: TvShowDetailWireFrameProtocol?) {
        self.view = view
        self.wireFrame = wireFrame
    }
    
    func loadTvShowDetail(tvShowDetail: TvShowDetail?) {
        if tvShowDetail != nil {
            if tvShowDetail?.posterPath != nil { loadTvShowPosterImage(posterImage: (tvShowDetail?.getCompletePosterPath())!) }
            view?.setTitle(title: tvShowDetail?.name ?? "")
            view?.setDescription(description: tvShowDetail?.overview ?? "")
        }
    }
    
    func loadTvShowPosterImage(posterImage: String) {
        if let posterImageUrl = URL.init(string: posterImage) {
            view?.setPosterImage(imageUrl: posterImageUrl)
        }
    }
}

//MARK: - TvShowDetailPresenterProtocol
extension TvShowDetailPresenter: TvShowDetailPresenterProtocol {
    
    func onViewDidLoad() {
        view?.showActivityIndicator()
        getTvShowDetail()
    }
    
    private func getTvShowDetail() {
        if let tvShowId = self.tvShowId {
            remoteDataManager?.getTvShow(tvShowId: tvShowId)
        }
    }
    
    func setTvShowId(tvShowId: Int) { self.tvShowId = tvShowId }
}

//MARK: - TvShowDetailRemoteDataManagerOutputProtocol
extension TvShowDetailPresenter: TvShowDetailRemoteDataManagerOutputProtocol {
    
    func onGetTvShowSuccess(tvShowDetail: TvShowDetail?) {
        loadTvShowDetail(tvShowDetail: tvShowDetail)
        view?.hideActivityIndicator()
    }
    
    func onGetTvShowError() {
        view?.hideActivityIndicator()
        view?.showError(message: "There was a problem loading the Tv Show detail; please check your connection and try again.")
    }
}
