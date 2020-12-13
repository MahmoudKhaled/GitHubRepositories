//
//  ImageDownloader.swift
//  GitHubRepositories
//
//  Created by Mahmoud Khaled on 12/11/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

typealias DownloadImageHandler = (UIImage?) -> Void

protocol ImageDownloading {
    func downloadImageWith(url: URL, completion: DownloadImageHandler?)
}

final class ImageDownloader: ImageDownloading {
    func downloadImageWith(url: URL, completion: DownloadImageHandler?) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                let image = UIImage(data: data) else {
                completion?(nil)
                return
            }
            completion?(image)
        }
        dataTask.resume()
    }
}
