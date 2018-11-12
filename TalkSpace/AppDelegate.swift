//
//  AppDelegate.swift
//  TalkSpace
//
//  Created by Sam on 11/8/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navController: UINavigationController = UINavigationController(rootViewController: ViewController())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}
