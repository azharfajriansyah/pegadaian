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
    
    lazy var blurEffect: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: effect)
        return effectView
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        appRoute()
        
        debugPrint("didFinishLaunchingWithOptions called")
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        debugPrint("willResignActive called")
        addBlurrEffect()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        //case untuk add blur view
        debugPrint("didEnterBackground called")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        debugPrint("willEnterForeground called")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        debugPrint("didBecomeActive called")
        blurEffect.removeFromSuperview()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // case untuk remember user credential
        debugPrint("willTerminate called")
        
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
    
    func addBlurrEffect() {
        blurEffect.frame = UIScreen.main.bounds
        window?.addSubview(blurEffect)
    }
}

