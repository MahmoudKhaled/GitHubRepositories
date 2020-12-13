//
//  StringExtension.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/13/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
