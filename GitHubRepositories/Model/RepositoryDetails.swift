//
//  RepositoryDetails.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/12/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

enum RepositoryDetailsData {
    case issues
    case subscriber
    case watchers
    case language
    case fork
    
    var iconTitle: String {
        switch self {
        case .issues: return "ic_issues"
        case .subscriber: return "ic_subscription"
        case .watchers: return "ic_watch"
        case .language: return "ic_coding"
        case .fork: return "ic_fork"
        }
    }
    
    var titleValue: String {
        switch self {
        case .issues: return NSLocalizedString("Issues", comment: "")
        case .subscriber: return NSLocalizedString("Subscribers", comment: "")
        case .watchers: return NSLocalizedString("Watchers", comment: "")
        case .language: return NSLocalizedString("Language", comment: "")
        case .fork: return NSLocalizedString("Forks", comment: "")
        }
    }
}

struct RepositoryDetails {
    
    var detailsData: RepositoryDetailsData
    var value: String
    
    init(detailsData: RepositoryDetailsData, value: String) {
        self.detailsData = detailsData
        self.value = value
    }
}
