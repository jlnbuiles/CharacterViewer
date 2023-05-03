//
//  EmptyView.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 5/3/23.
//

import UIKit

/**
 *  A convenient placeholder empty view with a configurable title.
 */
final class EmptyView: UIView {

    // MARK: - Properties

    var title: String?

    lazy var titleLabel: UILabel = {
        let emptyLabel = UILabel()
        emptyLabel.font = .italicSystemFont(ofSize: 15.0)
        emptyLabel.textAlignment = .center
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        return emptyLabel
    }()

    // MARK: - Initializers

    required init(title: String) {
        super.init(frame: .zero)
        self.title = title
        translatesAutoresizingMaskIntoConstraints = false
        configureLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI configuration

    private func configureLabel() {
        titleLabel.text = title

        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 35.0),
            titleLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
