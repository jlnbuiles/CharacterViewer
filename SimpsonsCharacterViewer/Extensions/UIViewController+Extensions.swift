//
//  UIViewController+Extensions.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/26/23.
//

import UIKit

extension UIViewController {

    func presentDimissableAlert(title: String, message: String) {
        let dialogMessage = UIAlertController(title: title,
                                              message: message,
                                              preferredStyle: .alert)
        dialogMessage.addAction(.init(title: UserMessage.General.dismiss, style: .default))
        present(dialogMessage, animated: true)
    }
}
