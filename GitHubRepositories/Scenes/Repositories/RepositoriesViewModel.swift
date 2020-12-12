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
    func searchByRepositoryName(name: String)
    func didSelectRepository(at indexPath: IndexPath)
}

final class RepositoriesViewModel {
    
    var repositories: Boxing<[Repository]> = Boxing([])
    
    private var repo: RepositoriesRepoProtocol
    private var navigator: RepositoryNavigatorProtocol
    private var totalPages: Int = 1
    private var currentPage: Int = 1
    
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
    
    func searchByRepositoryName(name: String) {
        repo.search(for: name)
    }
    
    func didSelectRepository(at indexPath: IndexPath) {
        let fullName = repositories.value[indexPath.row].fullName
        navigator.navigateTo(.repositoriesDetails(fullName: fullName))
    }
}

extension RepositoriesViewModel: RepositoriesRepoDelegate {
    func didGetPublicRepositories(repositories: [Repository]) {
        self.repositories.value.append(contentsOf: repositories)
    }
    
    func didGetSearchedItmes(repositories: [Repository]) {
        self.repositories.value = repositories
    }
    
    func showError(error: Error?) {
        
    }
    
    func didGetRepositoriesData(data: RepositoriesData) {
        self.repositories.value.append(contentsOf: data.repositories)
        self.totalPages = data.totalPages
        self.currentPage = 1
    }
}
