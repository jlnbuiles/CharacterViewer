//
//  RootSplitViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import UIKit

final class RootSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    // MARK: - Properties
    
    var masterViewController: UINavigationController? {
        didSet {
            setViewController(masterViewController, for: .primary)
        }
    }
    var detailViewController: CharacterDetailViewController? {
        didSet {
            setViewController(detailViewController, for: .secondary)
        }
    }

    // MARK: - Initializers

    override init(style: UISplitViewController.Style) {
        super.init(style: style)
        preferredDisplayMode = .oneOverSecondary
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    // MARK: - Split controller delegate

    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        .primary
    }
}
