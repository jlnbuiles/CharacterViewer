//
//  ApplicationRouter.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import UIKit

struct ApplicationRouter {

    let splitViewController: RootSplitViewController
    
    init(splitViewController: RootSplitViewController) {
        self.splitViewController = splitViewController
        let masterNavigatorController = CharacterListViewController(presenter: CharacterListPresenter())
        let masterController = UINavigationController(rootViewController: masterNavigatorController)
        splitViewController.masterViewController = masterController
        let presenter = CharacterDetailPresenter()
        splitViewController.detailViewController = CharacterDetailViewController(presenter: presenter)
    }

    func navigateToDetails(for character: Character) {
        guard let detailVC = splitViewController.detailViewController else { return }
        detailVC.presenter.character = character
        splitViewController.showDetailViewController(detailVC, sender: nil)
    }
}
