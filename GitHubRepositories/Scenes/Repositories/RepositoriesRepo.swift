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
}

protocol RepositoriesRepoDelegate: ErrorStatusProtocol {
    func didGetPublicRepositories(repositories: [Repository])
}

final class RepositoriesRepo: RepositoriesRepoProtocol {
    
    var delegate: RepositoriesRepoDelegate?
    
    // get all public repositories
    func getPublicRepositories() {
        RepositoryApi.PublicRepositories.request(model: [RepositoryResponse].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let repositoriesResponse):
                let reposioties = repositoriesResponse.map({Repository($0)})
                self.delegate?.didGetPublicRepositories(repositories: reposioties)
                
            case .failure(let error):
                self.delegate?.showError(error: error)
            }
        }
    }
}
