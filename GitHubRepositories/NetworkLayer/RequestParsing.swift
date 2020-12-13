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
    var response: HTTPURLResponse?
    var error: Error?
    var data: Data?
    
    var statusCode: Int {
        return response?.statusCode ?? 500
    }
}

//MARK: - Handle Response

public typealias DataResponse = (Data?, URLResponse?, Error?)

public protocol BaseResponseHandler {
    func handleResponse<T>(_ response: DataResponse, completion: @escaping ResponseResult<T>) where T: Codable
}

open class RequstParsing: NSObject {}

extension RequstParsing: BaseResponseHandler {
    
    public func handleResponse<T>(_ response: DataResponse, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        
        let (data, response, error) = response
        
        let httpURLResponse = response as? HTTPURLResponse
        let _response = Response(response: httpURLResponse, error: error, data: data)
        
        guard let _data = data else {
            completion(.failure(AppError.noInternet))
            return
        }
        
        if let error = error {
            completion(.failure(error))
            return
        }
        
        switch _response.statusCode {
        case 200:
            handleSuccess(_data, completion: completion)
        case 400...499:
            completion(.failure(decodeError(from: _data)))
        case 500:
            completion(.failure(AppError.internalServerError))
        default:
            break
        }
    }
    
    private func handleSuccess<T>(_ data: Data, completion: @escaping ResponseResult<T>) where T: Codable {
        do {
            let decoder = JSONDecoder()
            let modules = try decoder.decode(T.self, from: data)
            completion(.success(modules))
        } catch {
            completion(.failure(error))
        }
    }
    
    private func decodeError(from data: Data) -> Error {
        do {
            let error = try JSONDecoder().decode(ServerError.self, from: data)
            return AppError.validationError(message: error.message ?? "")
        } catch {
            return error
        }
    }
}
