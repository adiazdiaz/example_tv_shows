//
//  PopularTvShowsListCollectionViewCell.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 12/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

class PopularTvShowsListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() { roundImageView() }
    
    private func roundImageView() { image.layer.cornerRadius = 8.0 }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
}
