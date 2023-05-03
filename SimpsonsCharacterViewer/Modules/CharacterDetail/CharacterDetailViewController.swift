//
//  CharacterDetailViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import UIKit
import Combine

final class CharacterDetailViewController: UIViewController {

    // MARK: - Properties

    var presenter: CharacterDetailPresentable
    private var cancellables: Set<AnyCancellable> = []
    private let emptyView = EmptyView(title: UserMessage.CharacterDetail.noCharacterSelected)

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

    required init(presenter: CharacterDetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View controller life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupObserver()
        configureEmptyView()
    }

    // MARK: - Observer methods

    private func setupObserver() {
        presenter.publisher
            .receive(on: RunLoop.main)
            .compactMap { $0 }
            .sink { character in
                self.configure(with: character)
            }.store(in: &cancellables)
        if let character = presenter.character {
            configure(with: character)
            displayEmptyView(false)
        } else {
            displayEmptyView(true)
        }
    }

    // MARK: - UI configuration
    
    private func configure(with character: Character) {
        title = character.name
        configureLabel(with: character)
        configureImageView(with: character)
    }

    private func configureLabel(with character: Character) {
        descriptionLabel.text = character.description
        view.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 105.0),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.85),
        ])
        descriptionLabel.numberOfLines = 0
    }

    private func configureImageView(with character: Character) {
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 200.0, y: 150.0, width: 300.0, height: 200.0)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20.0),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.35),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        imageView.fetchImage(from: character.imageURL,
                             placeholder: UIImage(imgName: .mysteryMan))
    }

    private func configureEmptyView() {
        view.addSubview(emptyView)
        NSLayoutConstraint.extend(view: emptyView, toSuperView: view)
    }

    private func displayEmptyView(_ display: Bool) {
        emptyView.isHidden = !display
    }
}
