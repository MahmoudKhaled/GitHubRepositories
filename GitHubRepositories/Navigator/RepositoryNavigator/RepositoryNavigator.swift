//
//  RepositoryNavigator.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

enum RepositoryDestination {
    case repositoriesDetails(fullName: String)
}

protocol RepositoryNavigatorProtocol: class {
    func navigateTo(_ destination: RepositoryDestination)
}
final class RepositoryNavigator: BaseNavigator, RepositoryNavigatorProtocol {
    
    func navigateTo(_ destination: RepositoryDestination) {
        switch destination {
            
        case .repositoriesDetails(let fullName):
            controller.push(RepositoryDetailsViewController.create(fullName: fullName))
        }
    }
    
}
