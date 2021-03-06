//
//  PopularTvShowListAssembly.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 23/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation
import Swinject

class PopularTvShowListAssembly: Assembly {
    
    func assemble(container: Container) {
        
        //View
        container.register(PopularTvShowsListViewProtocol.self) { resolver in
            guard let viewController = UIStoryboard.main.instantiateViewController(withIdentifier: "PopularTvShowsListViewController") as? PopularTvShowsListViewController
                else { return PopularTvShowsListViewController() }
            viewController.imagesCache = resolver.resolve(ImagesCacheProtocol.self)
            return viewController
        }
        .initCompleted { resolver, _view in
            let view = _view as! PopularTvShowsListViewController
            view.presenter = resolver.resolve(PopularTvShowsListPresenterProtocol.self)
        }
        
        //Presenter
        container.register(PopularTvShowsListPresenterProtocol.self) { resolver in
            return PopularTvShowsListPresenter(view: resolver.resolve(PopularTvShowsListViewProtocol.self), wireFrame: resolver.resolve(PopularTvShowsListWireFrameProtocol.self))
        }
        .initCompleted { resolver, _presenter in
            let presenter = _presenter as! PopularTvShowsListPresenter
            presenter.interactor = resolver.resolve(PopularTvShowsListInteractorInputProtocol.self)
        }
        
        
        //Interactor
        container.register(PopularTvShowsListInteractorInputProtocol.self) { resolver in
            return PopularTvShowsListInteractor(networkManager: resolver.resolve(NetworkManagerProtocol.self),
                                                presenter: resolver.resolve(PopularTvShowsListPresenterProtocol.self) as? PopularTvShowsListInteractorOutputProtocol)
        }
        
        
        //WireFrame
        container.register(PopularTvShowsListWireFrameProtocol.self) {
            _ in PopularTvShowsListWireFrame()
        }
    }
    
}
