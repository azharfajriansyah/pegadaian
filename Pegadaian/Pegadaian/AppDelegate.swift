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
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window {
            window.rootViewController = OnboardingViewController()
            window.makeKeyAndVisible()
        }
        
        //CoreDataHelper.shared.createOnboardingContent(imageName: "test-image-name", copywriting: "Hello copywriting")
        let onboardingContent = CoreDataHelper.shared.fetchAllOnboardingContent()
        onboardingContent?.forEach({ content in
            debugPrint(content.id ?? "")
            debugPrint(content.imageName ?? "")
            debugPrint(content.copywriting ?? "")
        })
        
        //CoreDataHelper.shared.updateOnboardingContentWith(id: "8126FFAE-721F-49ED-8FF5-21A404FB9A55", newImageName: "hiya-update", newCopywriting: "Copywriting update")
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        debugPrint("App will resign active")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        debugPrint("App did enter background")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        debugPrint("App did become active")
    }

    

}

