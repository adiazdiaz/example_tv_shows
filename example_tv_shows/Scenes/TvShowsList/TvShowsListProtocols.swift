//
//  TvShowsListProtocols.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 09/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

protocol TvShowsListWireFrameProtocol {
    static func createTvShowsListScene() -> UIViewController
}

protocol TvShowsListViewProtocol {
    var presenter: TvShowsListPresenterProtocol? { get set }
    
    func showActivityIndicator()
    func hideActivityIndicator()
    func loadEmpty()
    func loadTvShows(tvShows: [TvShow])
    func showError()
}

protocol TvShowsListPresenterProtocol {
    var view: TvShowsListViewProtocol? { get set }
    var remoteDataManager: TvShowsListRemoteDataManagerInputProtocol? { get set }
    var wireFrame: TvShowsListWireFrameProtocol? { get set }
    
    func onViewDidLoad()
}

protocol TvShowsListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: TvShowsListRemoteDataManagerOutputProtocol? { get set }
    
    func getTvShows(page: Int)
}

protocol TvShowsListRemoteDataManagerOutputProtocol {
    func onGetTvShowsSuccess(tvShowsResponse: TvShowsResponse?)
    func onGetTvShowsError()
}
