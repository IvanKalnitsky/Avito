//
//  AppDelegate.swift
//  AvitoTest
//
//  Created by macbookp on 10.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
}

