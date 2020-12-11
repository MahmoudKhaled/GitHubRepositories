//
//  RepositoryOwner.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

struct RepositoryOwner {
    
    let id: Int
    let name: String
    let avatarImage: URL?
    let type: OwnerType
    
    init(_ response: RepositoryOwnerResponse?) {
        id = response?.id ?? 0
        name = response?.login ?? ""
        type = response?.type ?? .user
        
        if let image = response?.avatarURL {
            avatarImage = URL(string: image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        } else {
            avatarImage = nil
        }
    }
}
