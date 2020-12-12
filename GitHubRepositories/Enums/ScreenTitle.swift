//
//  ScreenTitle.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/13/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

enum ScreenTitle {
    case publicRepositories
    case repositoryDetails
    
    var title: String {
        switch self {
        case .publicRepositories:
            return "All Public Repositories".localized()
        case .repositoryDetails:
            return "Repository Details".localized()
        }
    }
}
