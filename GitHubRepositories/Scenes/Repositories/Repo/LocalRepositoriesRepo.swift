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
    
    private var repositorie: [Repository]
    
    init(_ repositorie: [Repository]) {
        self.repositorie = repositorie
    }
    
    func search(for reposiotryName: String) -> [Repository] {
        
        if !reposiotryName.isEmpty, reposiotryName.count >= 2 {
            let searchedRepositories = repositorie.filter({
                $0.name.lowercased().range(of: reposiotryName.lowercased()) != nil
            })
            return searchedRepositories
        } else {
            return repositorie
        }
    }
   
}
