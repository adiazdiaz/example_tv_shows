//
//  TvShowsListViewController.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 09/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

class TvShowsListViewController: UIViewController {
    
    var presenter: TvShowsListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
}

extension TvShowsListViewController: TvShowsListViewProtocol {
    
    func showActivityIndicator() {
        
    }
    
    func hideActivityIndicator() {
        
    }
    
    func loadEmpty() {
        print("Load empty")
    }
    
    func loadTvShows(tvShows: [TvShow]) {
        print(tvShows)
    }
    
    func showError() {
        
    }
}
