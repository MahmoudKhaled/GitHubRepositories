//
//  ResultError.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

enum AppError: Error, LocalizedError {
    case noInternet
    case badURL
    case internalServerError
    case validationError(message: String)
    
    var errorDescription: String? {
        switch self {
        case .noInternet:
            return NSLocalizedString("No Internet connection.Make sure that Wi-Fi or mobile data is turned on , than try again", comment: "")
        case .badURL:
            return NSLocalizedString("Bad url , you cannot access method", comment: "")
        case .internalServerError:
            return NSLocalizedString("Internal server error , please try again!", comment: "")
        case .validationError(let message):
            return message
        }
    }
}

struct ServerError: Decodable {
    var message: String?
}
