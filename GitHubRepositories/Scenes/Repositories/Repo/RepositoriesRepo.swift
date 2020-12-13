//
//  RepositoriesRepo.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

protocol ErrorStatusProtocol: class {
    func showError(error: Error?)
}

protocol RepositoriesRepoProtocol: class {
    var delegate: RepositoriesRepoDelegate? { get set }
    func getPublicRepositories()
    func search(for reposiotryName: String)
}

protocol RepositoriesRepoDelegate: ErrorStatusProtocol {
    func didGetPublicRepositories(repositories: [Repository])
    func didGetSearchedItmes(repositories: [Repository])
    func didGetRepositoriesData(data: RepositoriesData)
}

final class RepositoriesRepo: RepositoriesRepoProtocol {
    
    var delegate: RepositoriesRepoDelegate?
    private var localrepo: LocalRepositoriesRepoProtocol?
    
    // get all public repositories
    func getPublicRepositories() {
        RepositoryApi.publicRepositories.request(model: [RepositoryResponse].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let repositoriesResponse):
//                let reposioties = repositoriesResponse.map({Repository($0)})
//                self.delegate?.didGetPublicRepositories(repositories: reposioties)
//                self.localrepo = LocalRepositoriesRepo(reposioties, perPage: 10)
                self.didGetRemoteRepositores(response: repositoriesResponse)
            case .failure(let error):
                self.delegate?.showError(error: error)
            }
        }
    }
    
    private func didGetRemoteRepositores(response: [RepositoryResponse]) {
       let reposioties = response.map({Repository($0)})
        localrepo = LocalRepositoriesRepo(reposioties, perPage: 10)
        let data = localrepo!.paginateData(page: 1)
        delegate?.didGetRepositoriesData(data: data)
    }
    
    func search(for reposiotryName: String) {
        let searchedItems = localrepo?.search(for: reposiotryName)
        delegate?.didGetSearchedItmes(repositories: searchedItems ?? [])
    }
}


