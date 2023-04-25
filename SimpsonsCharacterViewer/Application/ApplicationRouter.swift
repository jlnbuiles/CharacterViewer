//
//  ApplicationRouter.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import UIKit

struct ApplicationRouter {

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigateToDetails(for character: Character) {
        let detailVC = CharacterDetailViewController(character: character)
        navigationController.pushViewController(detailVC, animated: true)
    }
}
