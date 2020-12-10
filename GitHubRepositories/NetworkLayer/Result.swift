//
//  Result.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

public typealias ResponseResult<T> = (ResultStatus<T>) -> Void

public enum ResultStatus<T> {
    case success(T)
    case failure(Error?)
}
