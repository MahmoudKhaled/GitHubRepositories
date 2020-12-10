//
//  ResultError.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

// MARK: - Validation Error for responseError

struct ValidationError: LocalizedError {
    
    private var message: String?
    private var data: Data?
    
    init(_ message: String?) {
        self.message = message
    }

    init(data: Data?) {
        self.data = data
    }

    private func errorValidation(data: Data?) -> ServerErrorModel? {
        let decoder = JSONDecoder()
        guard let _data = data, let model = try? decoder.decode(ServerErrorModel.self, from: _data) else {
            return nil
        }
        return model
    }

    var errorDescription: String? {
        return message ?? errorValidation(data: data)?.message
    }

    private struct ServerErrorModel: Codable {
        var message: String?
    }
}

// MARK: - NOInterntError
struct NoInternetError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString("No Internet connection.Make sure that Wi-Fi or mobile data is turned on , than try again", comment: "")
    }
}

// MARK: - Bad URL
struct BadURLError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString("Bad url , you cannot access method", comment: "")
    }
}

// MARK: - Internal Server Error

struct InternalServerError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString("Internal server error , please try again!", comment: "")
    }
}
