//
//  TvShowDetailWireFrame.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 13/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

class TvShowDetailWireFrame: TvShowDetailWireFrameProtocol {
    
    static func createTvShowDetailScreen(tvShowId: Int) -> UIViewController {
        let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "TvShowDetailViewControllerID")
        if let view = viewController as? TvShowDetailViewController {
            var remoteDataManager: TvShowDetailRemoteDataManagerInputProtocol = TvShowDetailRemoteDataManager()
            let wireFrame: TvShowDetailWireFrameProtocol = TvShowDetailWireFrame()
            var presenter: TvShowDetailPresenterProtocol & TvShowDetailRemoteDataManagerOutputProtocol = TvShowDetailPresenter()
            
            remoteDataManager.remoteRequestHandler = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.remoteDataManager = remoteDataManager
            presenter.setTvShowId(tvShowId: tvShowId)
            view.presenter = presenter
            
            return viewController
        }
        return UIViewController()
    }
}
