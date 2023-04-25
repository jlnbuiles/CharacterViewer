//
//  UIImageView+Extensions.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import UIKit

extension UIImageView {

    func fetchImage(from url: URL?, placeholder: UIImage?) {
        DispatchQueue.global().async { [weak self] in
            if let url,
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = placeholder
                }
            }
        }
    }
}
