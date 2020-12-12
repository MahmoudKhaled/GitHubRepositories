//
//  RepositoriesData.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

struct RepositoriesData {
    let perPages: Int
    var repositories: [Repository] = []
    
    var totalPages: Int {
        let count = Double(repositories.count)
        let _perPages = Double(perPages)
        let total = ceil(count/_perPages)
        return Int(total)
    }
    
    init(perPages: Int) {
        self.perPages = perPages
    }
}
