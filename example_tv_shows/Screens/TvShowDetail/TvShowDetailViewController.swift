//
//  TvShowDetailViewController.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 13/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

class TvShowDetailViewController: UIViewController {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var tvShowTitle: UILabel!
    @IBOutlet weak var tvShowDescription: UILabel!
    
    var presenter: TvShowDetailPresenterProtocol?
    
    private var initialPosterImageHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
}

//MARK: - TvShowDetailViewProtocol
extension TvShowDetailViewController: TvShowDetailViewProtocol {
    
    func showActivityIndicator() { startActivityIndicator() }
    
    func hideActivityIndicator() { stopActivityIndicator() }
    
    func setPosterImage(imageUrl: URL) {
        posterImage.loadFromUrl(url: imageUrl, completion: {_ in })
    }
    
    func setTitle(title: String) { tvShowTitle.text = title }
    
    func setDescription(description: String) { tvShowDescription.text = description }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let errorAlert = UIAlertController(title: "Error",
                                       message: message,
                                       preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(errorAlert, animated: true)
        }
    }
}
