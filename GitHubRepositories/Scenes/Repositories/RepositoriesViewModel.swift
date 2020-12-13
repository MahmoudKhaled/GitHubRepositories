//
//  RepositoriesViewModel.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

protocol RepositoriesViewModelProtocol: BaseViewModelProtocol {
    var repositories: Boxing<[Repository]> { get set }
    var errorMessage: Boxing<String> { get set }
    var numberOfRepositoriesRows: Int { get }
    func getReposotries()
    func getRepositoryItem(at indexPath: IndexPath) -> Repository
    func searchByRepositoryName(name: String)
    func didSelectRepository(at indexPath: IndexPath)
    func loadNextPage()
}

final class RepositoriesViewModel: BaseViewModel {
    
    var repositories: Boxing<[Repository]> = Boxing([])
    
    private var searchedRepositories: [Repository] = []
    private var publicRepositories: [Repository] = []
    private var isSearchedItems: Bool = false
    private var totalPages: Int = 1
    private var currentPage: Int = 1
    private var repo: RepositoriesRepoProtocol
    private var navigator: RepositoryNavigatorProtocol
    
    
    init(repo: RepositoriesRepoProtocol, navigator: RepositoryNavigatorProtocol) {
        self.repo = repo
        self.navigator = navigator
        super.init()
        self.repo.delegate = self
    }
}

extension RepositoriesViewModel: RepositoriesViewModelProtocol {
    
    var numberOfRepositoriesRows: Int {
        return repositories.value.count
    }

    func getReposotries() {
        repo.getPublicRepositories(page: currentPage, perPages: 10)
    }
    
    func getRepositoryItem(at indexPath: IndexPath) -> Repository {
        return repositories.value[indexPath.row]
    }
    
    func searchByRepositoryName(name: String) {
        // to prevent search pagination
        if !name.isEmpty, name.count >= 2 {
            repo.search(for: name)
            isSearchedItems = true
        } else {
            isSearchedItems = false
            repositories.value = publicRepositories
        }
    }
    
    func didSelectRepository(at indexPath: IndexPath) {
        let fullName = repositories.value[indexPath.row].fullName
        navigator.navigateTo(.repositoriesDetails(fullName: fullName))
    }
    
    func loadNextPage() {
        guard !isSearchedItems else { return }
        if currentPage < totalPages {
            currentPage += 1
            print("load page", currentPage)
            repo.paginateData(page: currentPage)
        }
    }
}

extension RepositoriesViewModel: RepositoriesRepoDelegate {

    func didGetRepositoriesData(data: RepositoriesData) {
        publicRepositories.append(contentsOf: data.repositories)
        repositories.value = publicRepositories
        totalPages = data.totalPages
    }
    
    func didGetSearchedItmes(repositories: [Repository]) {
        searchedRepositories = repositories
        self.repositories.value = searchedRepositories
    }
}
