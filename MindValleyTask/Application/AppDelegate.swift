//
//  AppDelegate.swift
//  MindValleyTask
//
//  Created by Omima Ibrahim on 7/17/20.
//  Copyright © 2020 Omima Ibrahim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let channelsView = ChannelsWireFrame.createChannelsView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = channelsView
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

