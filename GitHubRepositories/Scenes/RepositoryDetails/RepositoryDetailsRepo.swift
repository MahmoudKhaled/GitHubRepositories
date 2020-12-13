//
//  RepositoryDetailsRepo.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/12/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

protocol RepositoryDetailsRepoProtocol: class {
    var delegate: RepositoryDetailsRepoDelegate? { get set }
    func getDetails(repositoryFullName: String)
}

protocol RepositoryDetailsRepoDelegate: ErrorStatusProtocol {
    func didGetRepositoryDetails(repositoryDetails: Repository)
}

final class RepositoryDetailsRepo: RepositoryDetailsRepoProtocol {
    
    weak var delegate: RepositoryDetailsRepoDelegate?
    
    func getDetails(repositoryFullName: String) {
        RepositoryApi.repositoryDetails(repositoryFullName).request(model: RepositoryResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let reponse):
                let repository = Repository(reponse)
                self.delegate?.didGetRepositoryDetails(repositoryDetails: repository)
            case .failure(let error):
                self.delegate?.showError(error: error)
            }
        }
    }
}
