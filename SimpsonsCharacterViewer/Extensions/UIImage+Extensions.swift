//
//  UIImage+Extensions.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import UIKit

extension UIImage {
    convenience init?(imgName: ImageName) {
      self.init(named: imgName.rawValue)
    }
}
