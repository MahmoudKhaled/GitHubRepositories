//
//  RepositoryDetailsViewModel.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/12/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation
protocol RepositoryDetailsViewModelProtocol: BaseViewModelProtocol {
    var detailsData: Boxing<[RepositoryDetails]> { get set }
    var repository: Boxing<Repository> { get set }
    var numberOFDetailsDataRows: Int { get }
    func getDetailsItem(at indexPath: IndexPath) -> RepositoryDetails
    func getDetails()
}

final class RepositoryDetailsViewModel: BaseViewModel {
    
    var detailsData: Boxing<[RepositoryDetails]> = Boxing([])
    var repository: Boxing<Repository> = Boxing(Repository(nil))
    var numberOFDetailsDataRows: Int {
        return detailsData.value.count
    }
    
    private let repo: RepositoryDetailsRepoProtocol
    private let repositoryFullName: String
    
    init(repositoryFullName: String, repo: RepositoryDetailsRepoProtocol) {
        self.repositoryFullName = repositoryFullName
        self.repo = repo
        super.init()
        self.repo.delegate = self
    }
}

extension RepositoryDetailsViewModel: RepositoryDetailsViewModelProtocol {
    
    func getDetails() {
        repo.getDetails(repositoryFullName: repositoryFullName)
    }
    
    func getDetailsItem(at indexPath: IndexPath) -> RepositoryDetails {
        return detailsData.value[indexPath.row]
    }
    
}

extension RepositoryDetailsViewModel: RepositoryDetailsRepoDelegate {
    func didGetRepositoryDetails(repositoryDetails: Repository) {
        repository.value = repositoryDetails
        detailsData.value = repositoryDetails.detailsData
    }
    
//    func showError(error: Error?) {
//        
//    }
    
    
}
