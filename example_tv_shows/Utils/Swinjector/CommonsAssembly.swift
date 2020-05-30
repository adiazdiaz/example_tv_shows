//
//  CommonsAssembly.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 23/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import Foundation
import Swinject

class CommonsAssembly: Assembly {
    
    func assemble(container: Container) {
        
        //ImagesCache
        container.register(ImagesCacheProtocol.self) {
            _ in ImagesCache()
        }
        
        container.register(NetworkManagerProtocol.self) {
            _ in NetworkManager()
        }
    }
}
