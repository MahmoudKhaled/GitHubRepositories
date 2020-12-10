//
//  RequestBuilder.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

public typealias Parmaters = [String: Any]
public typealias Headers = [String: String]

// URL requst use to send requst
public protocol URLRequestProtocol {
    var urlRequst: URLRequest { get }
}

// Request Builder
public protocol RequestBuilder: URLRequestProtocol {
    /// Base Url
    var baseUrl: String { get }
    /// Path
    var path: String { get }
    /// Paramters
    var paramter: Parmaters? { get }
    /// HttpMethod
    var httpMethod: HTTPMethod { get }
    /// Headers
    var headers: Headers { get }
}


extension RequestBuilder {
    
    public var baseUrl: String {
        return EnpointConstants.baseUrl
    }
    
    public var urlRequst: URLRequest {
        let _urlPath = (baseUrl + self.path).addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""
        guard let _url = URL(string: _urlPath) else {
            fatalError("Invalid URL , Please check URL")
        }
        print("Requst URL :-",_url)
        var request = URLRequest(url: _url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }
}
