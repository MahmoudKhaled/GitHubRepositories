//
//  MainNavigator.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit


enum AppDesination {
    case main
}

class AppNavigator {
    
    private var destination: AppDesination
    init(destination: AppDesination) {
        self.destination = destination
    }
    
    private func detectDestination() -> UIViewController {
        switch destination {
        case .main:
            let vc = RepositoriesViewController.instance(.main)
            let viewModel = RepositoriesViewModel(repo: RepositoriesRepo(), navigator: RepositoryNavigator(vc))
            vc.setViewModel(viewModel)
            return vc
        }
    }
    
    func start() -> UIViewController {
        return CustomNavigationController(rootViewController: detectDestination())
    }
}
