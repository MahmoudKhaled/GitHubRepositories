//
//  CustomeNavigationController.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit
class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont()
        ]
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .white
    }
}
