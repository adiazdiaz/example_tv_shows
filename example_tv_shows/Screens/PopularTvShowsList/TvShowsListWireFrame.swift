//
//  TvShowsListWireFrame.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit


class PopularTvShowsListWireFrame: PopularTvShowsListWireFrameProtocol {
    
    static func createPopularTvShowsListScreen() -> UIViewController {
        let navigationController = UIStoryboard.main.instantiateViewController(withIdentifier: "NavigationControllerID")
        if let view = navigationController.children.first as? PopularTvShowsListViewController {
            var remoteDataManager: PopularTvShowsListRemoteDataManagerInputProtocol = PopularTvShowsListRemoteDataManager()
            let wireFrame: PopularTvShowsListWireFrameProtocol = PopularTvShowsListWireFrame()
            var presenter: PopularTvShowsListPresenterProtocol & PopularTvShowsListRemoteDataManagerOutputProtocol = PopularTvShowsListPresenter()
            
            remoteDataManager.remoteRequestHandler = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.remoteDataManager = remoteDataManager
            view.presenter = presenter
            
            return navigationController
        }
        return UIViewController()
    }
    
    func presentTvShowDetailScreen(fromView: PopularTvShowsListViewProtocol, tvShowId: Int) {
        let tvShowDetailViewController = TvShowDetailWireFrame.createTvShowDetailScreen(tvShowId: tvShowId)
        
        if let sourceView = fromView as? UIViewController {
            sourceView.navigationController?.pushViewController(tvShowDetailViewController, animated: true)
        }
    }
}
