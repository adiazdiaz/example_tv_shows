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
        return Swinjector.sharedAssembler.resolver.resolve(TvShowDetailViewProtocol.self, argument: tvShowId) as! TvShowDetailViewController
    }
}
