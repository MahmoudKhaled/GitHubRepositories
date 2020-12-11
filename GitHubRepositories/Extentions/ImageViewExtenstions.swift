//
//  ImageViewExtenstions.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(forURL url: URL?) {
        guard let url = url else {
            return
        }
        ImageDownloader().downloadImageWith(url: url) { [weak self] _image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = _image
            }
        }
    }
    
    func setImage(forURL url: String?) {
        guard let path = url, let _url = URL(string: path) else {
            return
        }
        self.setImage(forURL: _url)
    }
}
