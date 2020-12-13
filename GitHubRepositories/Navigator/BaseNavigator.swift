//
//  BaseNavigator.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import Foundation


import UIKit

public class BaseNavigator {
    
    var  controller: UIViewController
    init(_ controller: UIViewController) {
        self.controller = controller
    }
   
}
