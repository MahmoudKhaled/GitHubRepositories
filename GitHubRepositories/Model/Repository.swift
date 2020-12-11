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
    let description: String
    let owner: RepositoryOwner
    
    init(_ response: RepositoryResponse?) {
        id = response?.id ?? 0
        name = response?.name ?? ""
        description = response?.repositoryDescription ?? ""
        owner = RepositoryOwner(response?.owner)
    }
}
