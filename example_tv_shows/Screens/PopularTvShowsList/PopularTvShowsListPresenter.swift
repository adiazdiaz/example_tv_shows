//
//  PopularTvShowsListPresenter.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 09/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation

class PopularTvShowsListPresenter {
    
    var view: PopularTvShowsListViewProtocol?
    var interactor: PopularTvShowsListInteractorInputProtocol?
    var wireFrame: PopularTvShowsListWireFrameProtocol?
    
    var currentPage = 1
    var popularTvShows = [TvShow]()
    
    required init(view: PopularTvShowsListViewProtocol?, wireFrame: PopularTvShowsListWireFrameProtocol?) {
        self.view = view
        self.wireFrame = wireFrame
    }
}

//MARK: - TvShowsListPresenterProtocol
extension PopularTvShowsListPresenter: PopularTvShowsListPresenterProtocol {
    
    func onViewDidLoad() {
        view?.setNavigationBarOptions()
        view?.showActivityIndicator()
        getPopularTvShows()
    }
    
    private func getPopularTvShows() {
        interactor?.getPopularTvShows(page: currentPage)
    }
    
    func getPopularTvShowsCount() -> Int { return popularTvShows.count }
    
    func getTvShowAtIndex(index: Int) -> TvShow { return popularTvShows[index] }
    
    func showTvShowDetail(index: Int) {
        wireFrame?.presentTvShowDetailScreen(fromView: view!, tvShowId: getTvShowAtIndex(index: index).id)
    }
}

//MARK: - PopularTvShowsListInteractorOutputProtocol
extension PopularTvShowsListPresenter: PopularTvShowsListInteractorOutputProtocol {
    
    func onGetPopularTvShowsSuccess(popularTvShowsResponse: TvShowsResponse?) {
        if let newPopularTvShows = popularTvShowsResponse?.results, !newPopularTvShows.isEmpty {
            self.popularTvShows.append(contentsOf: newPopularTvShows)
            view?.loadPopularTvShows()
        } else {
            showGeneralError()
        }
        view?.hideActivityIndicator()
    }
    
    func onGetPopularTvShowsError() {
        view?.hideActivityIndicator()
        showGeneralError()
    }
    
    func showGeneralError() {
        view?.showError(message: "There was a problem loading the popular TV Shows; please put your The Movie DB Api Key into the .plist, check your connection and try again.")
    }
}
