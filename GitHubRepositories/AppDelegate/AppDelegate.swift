//
//  AppDelegate.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // SetupWindow
        setupWindow()
        
        // Start App
        startApp()
        return true
    }
    
    func setupWindow() {
        // Configure Window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    func startApp() {
        setRootViewController(AppNavigator(destination: .repositories).start(), animated: false)
    }
    
    func setRootViewController(_ viewController: UIViewController, animated: Bool) {
        if animated {
            let transition = UIView.AnimationOptions.transitionCrossDissolve
            window?.rootViewController = viewController
            UIView.transition(with: window!, duration: 0.5, options: transition, animations: {})
        } else {
            window?.rootViewController = viewController
        }
    }
}

