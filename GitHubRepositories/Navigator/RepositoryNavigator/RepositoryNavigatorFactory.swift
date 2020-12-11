//
//  RepositoryNavigatorFactory.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

final class  RepositoryNavigatorFactory {
    
    private unowned let navigator: RepositoryNavigatorProtocol
    
    init(navigator: RepositoryNavigatorProtocol) {
        self.navigator = navigator
    }
    
    func Repositories() -> RepositoriesViewController {
        let vc = RepositoriesViewController.instance(.main)
        let viewModel = RepositoriesViewModel(repo: RepositoriesRepo(), navigator: RepositoryNavigator(vc))
        vc.setViewModel(viewModel)
        return vc
    }
}
