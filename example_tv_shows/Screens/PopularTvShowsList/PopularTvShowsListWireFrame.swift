//
//  PopularTvShowsListWireFrame.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 10/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit


class PopularTvShowsListWireFrame: PopularTvShowsListWireFrameProtocol {
    
    static func createPopularTvShowsListScreen() -> UIViewController {
        guard let navigationController = UIStoryboard.main.instantiateViewController(withIdentifier: "NavigationControllerID") as? UINavigationController else {
            return UIViewController()
        }
        
        navigationController.viewControllers = [
            Swinjector.sharedAssembler.resolver.resolve(PopularTvShowsListViewProtocol.self) as! PopularTvShowsListViewController
        ]
        
        return navigationController
    }
    
    func presentTvShowDetailScreen(fromView: PopularTvShowsListViewProtocol, tvShowId: Int) {
        let tvShowDetailViewController = TvShowDetailWireFrame.createTvShowDetailScreen(tvShowId: tvShowId)
        
        if let sourceView = fromView as? UIViewController {
            sourceView.navigationController?.pushViewController(tvShowDetailViewController, animated: true)
        }
    }
}
