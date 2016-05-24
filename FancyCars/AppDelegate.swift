//
//  AppDelegate.swift
//  FancyCars
//
//  Created by Grégoire Lhotellier on 17/05/2016.
//  Copyright © 2016 Grégoire Lhotellier. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let listTypeController = ListTypeController()
        let navigationController = UINavigationController(rootViewController: listTypeController)
        navigationController.navigationBar.translucent = false
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}
