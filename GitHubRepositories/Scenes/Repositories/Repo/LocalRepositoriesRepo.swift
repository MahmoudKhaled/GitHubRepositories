//
//  LocalRepositoriesRepo.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

protocol LocalRepositoriesRepoProtocol {
    func search(for reposiotryName: String) -> [Repository]
    func paginateData(page: Int) -> RepositoriesData
}

final class LocalRepositoriesRepo: LocalRepositoriesRepoProtocol {
    
    private var repositories: [Repository]
    private var perPages: Int
    
    private var searchedRepositories: [Repository] = []
    private var repositoriesData = RepositoriesData()
    
    private lazy var totalPages: Int = {
        let count = Double(repositories.count)
        let _perPages = Double(perPages)
        let total = ceil(count/_perPages)
        return Int(total)
    }()
    
    init(_ repositories: [Repository], perPage: Int) {
        self.repositories = repositories
        self.perPages = perPage
    }
    
//    func getRepositories(page: Int, searchKey: String = "") {
//        if !searchKey.isEmpty {
//
//        }
//    }
    
    func search(for reposiotryName: String) -> [Repository] {
        
        if !reposiotryName.isEmpty, reposiotryName.count >= 2 {
            let searchedRepositories = repositories.filter({
                $0.name.lowercased().range(of: reposiotryName.lowercased()) != nil
            })
            return searchedRepositories
        } else {
            return repositories
        }
    }
    
    func paginateData(page: Int) -> RepositoriesData {
        
        var startIndex: Int = 0
        var endIndex: Int = 0
        startIndex = (page * perPages) - perPages
        
        if page == totalPages {
            endIndex = repositories.endIndex
        } else {
            endIndex = (page * perPages) - 1
        }

        let data = repositories[startIndex...endIndex]
        repositoriesData.repositories = Array(data)
        repositoriesData.totalPages = totalPages
        return repositoriesData
    }
   
}
