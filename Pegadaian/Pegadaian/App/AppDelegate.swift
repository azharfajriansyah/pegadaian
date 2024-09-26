//
//  AppDelegate.swift
//  Pegadaian
//
//  Created by FDN-Azhar on 12/08/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        appRoute()
        
        debugPrint("didFinishLaunchingWithOptions called")
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        debugPrint("willResignActive called")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        debugPrint("didEnterBackground called")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        debugPrint("willEnterForeground called")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        debugPrint("didBecomeActive called")
    }
}

extension AppDelegate {
    func appRoute() {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window {
            let viewController = PGSKeychain.shared.userSessionExist ? HomepageWireframe().viewController : LoginWireframe().viewController
            window.rootViewController = UINavigationController(rootViewController: viewController)
            window.makeKeyAndVisible()
        }
    }
}

