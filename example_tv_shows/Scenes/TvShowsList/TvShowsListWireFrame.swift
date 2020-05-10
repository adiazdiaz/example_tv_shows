//
//  TvShowsListWireFrame.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit


class TvShowsListWireFrame: TvShowsListWireFrameProtocol {
    
    static func createTvShowsListScene() -> UIViewController {
        let navigationController = mainStoryBoard.instantiateViewController(withIdentifier: "TvShowsNavigationController")
        if let view = navigationController.children.first as? TvShowsListViewController {
            var remoteDataManager: TvShowsListRemoteDataManagerInputProtocol = TvShowsListRemoteDataManager()
            let wireFrame: TvShowsListWireFrameProtocol = TvShowsListWireFrame()
            var presenter: TvShowsListPresenterProtocol & TvShowsListRemoteDataManagerOutputProtocol = TvShowsListPresenter()
            
            remoteDataManager.remoteRequestHandler = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.remoteDataManager = remoteDataManager
            view.presenter = presenter
            
            return navigationController
        }
        return UIViewController()
    }
    
    static var mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
}
