//
//  MainNavigator.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit


enum AppDesination {
    case repositories
}

class AppNavigator {
    
    private var destination: AppDesination
    
    init(destination: AppDesination) {
        self.destination = destination
    }
    
    func start() -> UIViewController  {
        switch destination {
        case .repositories:
            let vc = RepositoriesViewController.create()
            let navigationController = CustomNavigationController(rootViewController: vc)
            return navigationController
        }
    }
}
