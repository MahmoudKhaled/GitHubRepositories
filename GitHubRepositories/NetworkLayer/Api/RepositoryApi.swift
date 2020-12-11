//
//  RepositoryApi.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

enum RepositoryApi: RequestBuilder, RequestProtocol {
    
    case PublicRepositories
    
    var path: String {
        switch self {
        case .PublicRepositories:
            return EnpointConstants.publicRepository
        }
    }
    
    var paramter: Parmaters? {
        switch self {
        default: return nil
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: Headers {
        switch self {
        default: return [:]
        }
    }
}
