//
//  CharacterDetailViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import UIKit

final class CharacterDetailViewController: UIViewController {

    // MARK: - Properties

    let character: Character
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    // MARK: - Initializers

    required init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = character.name
        configureViews()
    }

    // MARK: - UI configuration
    
    private func configureViews() {
        configureLabel()
        configureImageView()
    }

    private func configureLabel() {
        descriptionLabel.text = character.description
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 105.0),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.85),
        ])
        descriptionLabel.numberOfLines = 0
    }

    private func configureImageView() {
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 200.0, y: 150.0, width: 300.0, height: 200.0)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20.0),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.35),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        imageView.fetchImage(from: character.imageURL,
                             placeholder: UIImage(named: "mystery-character"))
    }
}
