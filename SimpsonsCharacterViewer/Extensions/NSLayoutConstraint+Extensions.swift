//
//  NSLayoutConstraint+Extensions.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 5/3/23.
//

import UIKit

extension NSLayoutConstraint {

    static func extend(view: UIView, toSuperView: UIView) {
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: toSuperView.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: toSuperView.centerXAnchor),
            view.widthAnchor.constraint(equalTo: toSuperView.widthAnchor),
            view.heightAnchor.constraint(equalTo: toSuperView.heightAnchor)
        ])
    }
}
