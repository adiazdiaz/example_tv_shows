//
//  AppDelegate.swift
//  example_tv_shows
//
//  Created by Alberto Díaz Díaz on 09/05/2020.
//  Copyright © 2020 Alberto Díaz Díaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tvShowsList = TvShowsListWireFrame.createTvShowsListScene()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tvShowsList
        window?.makeKeyAndVisible()
        
        return true
    }
}

