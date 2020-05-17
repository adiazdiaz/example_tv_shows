//
//  PopularTvShowsListProtocols.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 09/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

protocol PopularTvShowsListWireFrameProtocol {
    static func createPopularTvShowsListScreen() -> UIViewController
    func presentTvShowDetailScreen(fromView: PopularTvShowsListViewProtocol, tvShowId: Int)
}

protocol PopularTvShowsListViewProtocol {
    var presenter: PopularTvShowsListPresenterProtocol? { get set }
    
    func showActivityIndicator()
    func hideActivityIndicator()
    func setNavigationBarOptions()
    func loadPopularTvShows()
    func showError(message: String)
}

protocol PopularTvShowsListPresenterProtocol {
    var view: PopularTvShowsListViewProtocol? { get set }
    var remoteDataManager: PopularTvShowsListRemoteDataManagerInputProtocol? { get set }
    var wireFrame: PopularTvShowsListWireFrameProtocol? { get set }
    
    func onViewDidLoad()
    func getPopularTvShowsCount() -> Int
    func getTvShowAtIndex(index: Int) -> TvShow
    func showTvShowDetail(index: Int)
}

protocol PopularTvShowsListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: PopularTvShowsListRemoteDataManagerOutputProtocol? { get set }
    
    func getPopularTvShows(page: Int)
}

protocol PopularTvShowsListRemoteDataManagerOutputProtocol {
    func onGetPopularTvShowsSuccess(popularTvShowsResponse: TvShowsResponse?)
    func onGetPopularTvShowsError()
}
