//
//  PopularTvShowsListViewController.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 09/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

class PopularTvShowsListViewController: UIViewController {
    
    @IBOutlet weak var popularTvShowsCollectionView: UICollectionView!
    
    var presenter: PopularTvShowsListPresenterProtocol?
    
    private let itemsPerRow: CGFloat = 3
    private let spacingForItems: CGFloat = 25.0
    private let spacingForLinesOfItems: CGFloat = 20.0
    private let itemAspectRatio = CGFloat(1.0 / 2.0)
    
    private let imagesCache = ImagesCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        imagesCache.clearImagesLoaded()
    }
}

//MARK: - TvShowsListViewProtocol
extension PopularTvShowsListViewController: PopularTvShowsListViewProtocol {
    
    func showActivityIndicator() { startActivityIndicator() }
    
    func hideActivityIndicator() { stopActivityIndicator() }
    
    func setNavigationBarOptions() {
        navigationController?.navigationBar.clearNavigationBar()
    }
    
    func loadPopularTvShows() {
        DispatchQueue.main.async { self.popularTvShowsCollectionView.reloadData() }
    }
    
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

//MARK: - UICollectionViewDataSource
extension PopularTvShowsListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getPopularTvShowsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let tvShowCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularTvShowsListCollectionViewCellID", for: indexPath) as? PopularTvShowsListCollectionViewCell
            else {
                fatalError("The dequeued cell is not an instance of PopularTvShowsListCollectionViewCell")
            }
        
        if let tvShow = presenter?.getTvShowAtIndex(index: indexPath.row) {
            configureTvShowCell(cell: tvShowCell, tvShow: tvShow)
        }
        
        return tvShowCell
    }
    
    func configureTvShowCell(cell: PopularTvShowsListCollectionViewCell, tvShow: TvShow) {
        if let imageUrl = URL(string: tvShow.getCompleteThumbnailPosterPath()) {
            setTvShowImage(cell: cell, imageUrl: imageUrl)
        }
        cell.title.text = tvShow.name
    }
    
    func setTvShowImage(cell: PopularTvShowsListCollectionViewCell, imageUrl: URL) {
        if let imageLoaded = imagesCache.getImageLoaded(imageUrl: imageUrl) {
            cell.image.image = imageLoaded
        } else {
            cell.image.loadFromUrl(url: imageUrl, completion: { image in
                self.imagesCache.addImageToImagesLoaded(imageUrl: imageUrl, image: image)
            })
        }
    }
}

//MARK: - UICollectionViewDelegate
extension PopularTvShowsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showTvShowDetail(index: indexPath.row)
    }
}

//MARK: - UICollectionViewDataSource
extension PopularTvShowsListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacingIntoItems = (itemsPerRow - 1) * spacingForItems
        let availableWidth = collectionView.frame.size.width - totalSpacingIntoItems
        let itemWidth = availableWidth / itemsPerRow
        let itemHeight = itemWidth / itemAspectRatio
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacingForItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacingForLinesOfItems
    }
}
