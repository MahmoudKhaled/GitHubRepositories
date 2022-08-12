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

protocol RepositoriesRepoProtocol: AnyObject {
    var delegate: RepositoriesRepoDelegate? { get set }
    func getPublicRepositories(page: Int, perPages: Int)
    func search(for reposiotryName: String)
    func paginateData(page: Int)
}

protocol RepositoriesRepoDelegate: ErrorStatusProtocol {
    func didGetSearchedItmes(repositories: [Repository])
    func didGetRepositoriesData(data: RepositoriesData)
}

final class RepositoriesRepo: RepositoriesRepoProtocol {
    
    weak var delegate: RepositoriesRepoDelegate?
    private var localRepo: LocalRepositoriesRepoProtocol?
    
    // get all public repositories
    func getPublicRepositories(page: Int, perPages: Int) {
        RepositoryApi.publicRepositories.request(model: [RepositoryResponse].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let repositoriesResponse):
                let reposioties = repositoriesResponse.map({Repository($0)})
                self.localRepo = LocalRepositoriesRepo(reposioties, perPages: perPages)
                self.didGetRemoteRepositores(page: page)
                
            case .failure(let error):
                self.delegate?.showError(error: error)
            }
        }
    }
    
    private func didGetRemoteRepositores(page: Int) {
        paginateData(page: page)
    }
    
    func paginateData(page: Int) {
        if let data = localRepo?.paginateData(page: page) {
          delegate?.didGetRepositoriesData(data: data)
        }
    }
    
    func search(for reposiotryName: String) {
        let searchedItems = localRepo?.search(for: reposiotryName)
        delegate?.didGetSearchedItmes(repositories: searchedItems ?? [])
    }
}


