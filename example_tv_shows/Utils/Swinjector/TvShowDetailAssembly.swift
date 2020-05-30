//
//  TvShowDetailAssembly.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 23/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation
import Swinject

class TvShowDetailAssembly: Assembly {
    
    func assemble(container: Container) {
        
        var tvShowId: Int?
        
        //View
        container.register(TvShowDetailViewProtocol.self) { (resolver: Resolver, _tvShowId: Int) in
                    guard let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "TvShowDetailViewControllerID") as? TvShowDetailViewController
                        else { return TvShowDetailViewController() }
                    tvShowId = _tvShowId
                    return viewController
            }
            .initCompleted { resolver, _view in
                let view = _view as! TvShowDetailViewController
                let presenter = resolver.resolve(TvShowDetailPresenterProtocol.self)
                presenter?.setTvShowId(tvShowId: tvShowId!)
                view.presenter = presenter
            }
        
        //Presenter
        container.register(TvShowDetailPresenterProtocol.self) { resolver in
            return TvShowDetailPresenter(view: resolver.resolve(TvShowDetailViewProtocol.self, argument: tvShowId!), wireFrame: resolver.resolve(TvShowDetailWireFrameProtocol.self))
        }
        .initCompleted { resolver, _presenter in
            let presenter = _presenter as! TvShowDetailPresenter
            presenter.interactor = resolver.resolve(TvShowDetailInteractorInputProtocol.self)
        }

        //Interactor
        container.register(TvShowDetailInteractorInputProtocol.self) { resolver in
            return TvShowDetailInteractor(networkManager: resolver.resolve(NetworkManagerProtocol.self),
                                          presenter: resolver.resolve(TvShowDetailPresenterProtocol.self) as? TvShowDetailInteractorOutputProtocol)
        }
        
        //WireFrame
        container.register(TvShowDetailWireFrameProtocol.self) {
            _ in TvShowDetailWireFrame()
        }
    }
}
