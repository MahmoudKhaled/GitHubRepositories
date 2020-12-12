//
//  BaseViewModel.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/13/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

protocol BaseViewModelProtocol: ErrorStatusProtocol  {
    var errorMessage: Boxing<String> { get set }
}

class BaseViewModel: BaseViewModelProtocol {
    
    var errorMessage: Boxing<String> = Boxing("")
    
    func showError(error: Error?) {
        errorMessage.value = error?.localizedDescription ?? ""
    }
}
