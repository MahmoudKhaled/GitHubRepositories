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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        let vc = RepositoriesViewController.instance(.main)
        let viewModel = RepositoriesViewModel(repo: RepositoriesRepo(), navigator: RepositoryNavigator(vc))
        vc.setViewModel(viewModel)
        window?.rootViewController = CustomNavigationController(rootViewController: vc)
        return true
    }
}

