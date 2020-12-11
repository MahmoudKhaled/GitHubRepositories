//
//  RepositoriesViewModel.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

protocol RepositoriesViewModelProtocol {
    var repositories: Boxing<[Repository]> { get set }
    var numberOfRepositoriesRows: Int { get }
    func getReposotries()
    func getRepositoryItem(at indexPath: IndexPath) -> Repository
}

final class RepositoriesViewModel {
    
    var repositories: Boxing<[Repository]> = Boxing([])
    
    private var repo: RepositoriesRepoProtocol
    private var navigator: RepositoryNavigatorProtocol
    
    init(repo: RepositoriesRepoProtocol, navigator: RepositoryNavigatorProtocol) {
        self.repo = repo
        self.navigator = navigator
        self.repo.delegate = self
    }
}

extension RepositoriesViewModel: RepositoriesViewModelProtocol {
    
    var numberOfRepositoriesRows: Int {
        return repositories.value.count
    }

    func getReposotries() {
        repo.getPublicRepositories()
    }
    
    func getRepositoryItem(at indexPath: IndexPath) -> Repository {
        return repositories.value[indexPath.row]
    }
}

extension RepositoriesViewModel: RepositoriesRepoDelegate {
    func didGetPublicRepositories(repositories: [Repository]) {
        self.repositories.value.append(contentsOf: repositories)
    }
    
    func showError(error: Error?) {
        
    }
}
