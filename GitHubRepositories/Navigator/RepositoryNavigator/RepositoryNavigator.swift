//
//  RepositoryNavigator.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

enum RepositoryDestination {
    case repositories
}

protocol RepositoryNavigatorProtocol: class {
    func navigateTo(_ destination: RepositoryDestination)
}

final class RepositoryNavigator: BaseNavigator, RepositoryNavigatorProtocol {
    
    private lazy var factory = RepositoryNavigatorFactory(navigator: self)
    
    func navigateTo(_ destination: RepositoryDestination) {
        switch destination {
            
        case .repositories:
            controller.push(factory.Repositories())
        }
    }
    
}
