//
//  ViewControllerExtention.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

public enum StoryBoardIdentifier: String {
    case main = "Main"
}

// MARK: - Naviagtion ID

public enum NavigationNames: String {
    case homeNav = "MainNav"
}

// MARK: - Instate

extension UIViewController {
    private static var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    private class func instate<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        return (storyboard.instantiateViewController(withIdentifier: identifier) as? T)!
    }

    private class func instate(_ storyboard: StoryBoardIdentifier) -> Self {
        let _storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return instate(_storyboard, identifier: identifier)
    }

    public class func instance(_ storyboard: StoryBoardIdentifier = .main) -> Self {
        return instate(storyboard)
    }
    
    public func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showErrorAlert(with message: String) {
        AlertBuilder(title: "", message: message, preferredStyle: .alert)
            .addAction(title: NSLocalizedString("Ok", comment: ""), style: .default)
            .build()
            .show()
    }
}

public extension UINavigationController
{
    class func instance(_ identifier: NavigationNames, forStoryboard storyboard: StoryBoardIdentifier = .main) -> UINavigationController {
        return (UIStoryboard(name: storyboard.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier.rawValue)
            ) as! UINavigationController
    }
}
