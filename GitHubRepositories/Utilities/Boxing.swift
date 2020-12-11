//
//  Boxing.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/10/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation

public class Boxing<T> {
    
    typealias Listner = ((T) -> Void)
    var listner: Listner?

    var value: T {
        didSet {
            listner?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func binding(_ listner: Listner?) {
        self.listner = listner
    }
}
