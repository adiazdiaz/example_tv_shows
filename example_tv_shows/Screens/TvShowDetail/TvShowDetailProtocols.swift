//
//  TvShowDetailProtocols.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 13/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

protocol TvShowDetailWireFrameProtocol {
    static func createTvShowDetailScreen(tvShowId: Int) -> UIViewController
}

protocol TvShowDetailViewProtocol {
    var presenter: TvShowDetailPresenterProtocol? { get set }
    
    func showActivityIndicator()
    func hideActivityIndicator()
    func setPosterImage(imageUrl: URL)
    func setTitle(title: String)
    func setDescription(description: String)
    func showError(message: String)
}

protocol TvShowDetailPresenterProtocol {
    var view: TvShowDetailViewProtocol? { get set }
    var interactor: TvShowDetailInteractorInputProtocol? { get set }
    var wireFrame: TvShowDetailWireFrameProtocol? { get set }
    
    func onViewDidLoad()
    func setTvShowId(tvShowId: Int)
}

protocol TvShowDetailInteractorInputProtocol {
    var presenter: TvShowDetailInteractorOutputProtocol? { get set }
    
    func getTvShow(tvShowId: Int)
}

protocol TvShowDetailInteractorOutputProtocol {
    func onGetTvShowSuccess(tvShowDetail: TvShowDetail?)
    func onGetTvShowError()
}
