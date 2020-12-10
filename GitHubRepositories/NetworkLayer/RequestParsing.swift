//
//  RequestParsing.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

// MARK: - Response
struct Response {
    var reponse: HTTPURLResponse?
    var error: Error?
    var data: Data?
    
    var statusCode: Int {
        return reponse?.statusCode ?? 500
    }
}

//MARK: - Handle Response

public typealias DataResponse = (Data?, URLResponse?, Error?)

public protocol BaseResponseHandler {
    func handleResponse<T>(_ response: DataResponse, completion: @escaping ResponseResult<T>) where T: Codable
}

open class RequstParsing: NSObject {}

extension RequstParsing: BaseResponseHandler {
    
    public func handleResponse<T>(_ response: DataResponse, completion: @escaping (ResultStatus<T>) -> Void) where T : Decodable, T : Encodable {
        
        let httpURLResponse = response.1 as? HTTPURLResponse
        let _response = Response(reponse: httpURLResponse, error: response.2, data: response.0)
        
        guard let _ = response.0 else {
            completion(ResultStatus<T>.failure(NoInternetError()))
            return
        }
        
        switch _response.statusCode {
        case 200:
            handleSuccess(response, completion: completion)
        case 400...499:
            completion(ResultStatus<T>.failure(ValidationError(data: _response.data)))
        case 500:
            completion(ResultStatus<T>.failure(InternalServerError()))
        default:
            break
        }
    }
    
    private func handleSuccess<T>(_ response: DataResponse, completion: @escaping ResponseResult<T>) where T: Codable {
        if let json = response.0 {
            do {
                let decoder = JSONDecoder()
                let modules = try decoder.decode(T.self, from: json)
                completion(ResultStatus<T>.success(modules))
            } catch {
                completion(ResultStatus<T>.failure(error))
            }
        } else {
            completion(ResultStatus<T>.failure(response.2))
        }
    }
}
