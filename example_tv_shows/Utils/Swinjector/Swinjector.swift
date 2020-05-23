//
//  Swinjector.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 23/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation
import Swinject

class Swinjector {
    
    static let sharedAssembler: Assembler = {
        let container = Container.sharedContainer
        let assembler = Assembler([
            CommonsAssembly(),
            PopularTvShowListAssembly(),
            TvShowDetailAssembly()
        ], container: container)
        return assembler
    }()
    
}
