//
//  RequestProtocol.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

public protocol RequestProtocol {
    func request<T>(model: T.Type, completion: @escaping ResponseResult<T>) where T: Codable
}

extension RequestProtocol where Self: URLRequestProtocol {
    
    public func request<T>(model: T.Type, completion: @escaping ResponseResult<T>) where T: Codable {
        let task = URLSession.shared.dataTask(with: urlRequst) { (data, urlResponse, error) in
            let parsing = RequstParsing()
            DispatchQueue.main.async {
                parsing.handleResponse((data, urlResponse, error), completion: completion)
            }
        }
        task.resume()
    }
}
