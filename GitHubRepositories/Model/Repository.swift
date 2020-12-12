//
//  Repository.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

struct Repository {
    
    let id: Int
    let name: String
    let fullName: String
    let description: String
    let owner: RepositoryOwner
    var detailsData: [RepositoryDetails] = []
    let subscribersCount: Int
    let forks: Int
    let openIssues: Int
    let watchers: Int
    let language: String
    
    init(_ response: RepositoryResponse?) {
        id = response?.id ?? 0
        name = response?.name ?? ""
        fullName = response?.fullName ?? ""
        description = response?.repositoryDescription ?? ""
        owner = RepositoryOwner(response?.owner)
        subscribersCount = response?.subscribersCount ?? 0
        forks = response?.forks ?? 0
        openIssues = response?.openIssues ?? 0
        watchers = response?.watchers ?? 0
        language = response?.language ?? ""
        
        detailsData.append(RepositoryDetails(detailsData: .fork, value: String(forks)))
        detailsData.append(RepositoryDetails(detailsData: .subscriber, value: String(subscribersCount)))
        detailsData.append(RepositoryDetails(detailsData: .issues, value: String(openIssues)))
        detailsData.append(RepositoryDetails(detailsData: .watchers, value: String(watchers)))
        detailsData.append(RepositoryDetails(detailsData: .language, value: language))
    }
}
