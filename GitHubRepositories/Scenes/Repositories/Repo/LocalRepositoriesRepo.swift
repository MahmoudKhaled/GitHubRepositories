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
    
}

final class LocalRepositoriesRepo: LocalRepositoriesRepoProtocol {
    
    private var repositories: [Repository]
    private var searchedRepositories: [Repository] = []
    private var repositoriesData = RepositoriesData(perPages: 10)
    
    init(_ repositories: [Repository]) {
        self.repositories = repositories
        repositoriesData.repositories = repositories
    }
    
    func getRepositories(page: Int, searchKey: String = "") {
        if !searchKey.isEmpty {
            
        }
    }
    
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
    
    func getData(page: Int, perPage: Int) -> [Repository] {
        let startIndex = (page * perPage) - perPage
        let endIndex = (page * perPage) - 1
//        let n = repositoriesData.repositories.endIndex
        let data = repositoriesData.repositories[startIndex...endIndex]
        return Array(data)
        
    }
   
}
