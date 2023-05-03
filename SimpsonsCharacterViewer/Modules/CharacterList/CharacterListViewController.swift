//
//  CharacterListViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import UIKit

final class CharacterListViewController: UITableViewController {

    // MARK: - Properties

    private let presenter: CharacterListPresentable
    private var searchTableViewController = SearchResultsTableViewController()
    private let emptyView = EmptyView(title: UserMessage.CharacterList.noCharacters)

    // MARK: - Initializers

    required init(presenter: CharacterListPresentable) {
        self.presenter = presenter
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = UserMessage.CharacterList.title
        configureSearchBar()
        configureEmptyView()
        fetchCharacters()
    }

    // MARK: - UI configuration

    private func configureSearchBar() {
        navigationItem.searchController = .init(searchResultsController: searchTableViewController)
        navigationItem.searchController?.searchResultsUpdater = self
        definesPresentationContext = true
        searchTableViewController.tableView.delegate = self
    }

    private func configureEmptyView() {
        guard let rootView = navigationController?.view else {
            return
        }

        rootView.addSubview(emptyView)
        NSLayoutConstraint.extend(view: emptyView, toSuperView: rootView)
    }

    private func displayEmptyView(_ display: Bool) {
        emptyView.isHidden = !display
    }

    // MARK: - Convenience methods

    private func fetchCharacters() {
        Task {
            switch await presenter.getCharacters() {
            case .success:
                tableView.reloadData()
                displayEmptyView(false)
            case .failure:
                self.presentDimissableAlert(title: UserMessage.General.unknownErrorTitle,
                                            message: UserMessage.General.unknownErrorBody)
                displayEmptyView(true)
            }
        }
    }
}

// MARK: - Tableview methods

extension CharacterListViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let router = DependencyContainer.shared.resolve(ApplicationRouter.self) else { return }

        if tableView === searchTableViewController.tableView {
            let characterName = searchTableViewController.results[indexPath.row]
            if let foundCharacter = presenter.characters?.first(where: { $0.name == characterName }) {
                router.navigateToDetails(for: foundCharacter)
            }
        } else if let character = presenter.characters?[indexPath.row] {
            router.navigateToDetails(for: character)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = presenter.characters?[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = character?.name
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.characters?.count ?? 0
    }
}

// MARK: - Search methods

extension CharacterListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

        guard let text = navigationItem.searchController?.searchBar.text,
              let characters = presenter.characters else { return }

        searchTableViewController.results.removeAll()
        characters.forEach { character in
            if character.name.contains(text) {
                self.searchTableViewController.results.append(character.name)
            }
        }
        searchTableViewController.tableView.reloadData()
    }
}
