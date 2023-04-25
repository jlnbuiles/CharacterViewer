//
//  CharacterListViewController.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import UIKit
import Combine

final class CharacterListViewController: UITableViewController {

    // MARK: - Properties

    private let presenter: CharacterListPresentable
    private var cancellables: Set<AnyCancellable> = []
    private var searchTableViewController = SearchResultsTableViewController()

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
        presenter.getCharacters()
        observeCharacters()
        configureSearchBar()
    }

    // MARK: - UI configuration

    private func configureSearchBar() {
        navigationItem.searchController = UISearchController(searchResultsController: searchTableViewController)
        navigationItem.searchController?.searchResultsUpdater = self
        definesPresentationContext = true
        searchTableViewController.tableView.delegate = self
    }

    // MARK: - Convenience methods

    private func observeCharacters() {
        presenter.publisher
            .receive(on: RunLoop.main)
            .sink { _ in
                self.tableView.reloadData()
            }.store(in: &cancellables)
    }
}

// MARK: - Tableview methods

extension CharacterListViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let router = DependencyContainer.shared.resolve(ApplicationRouter.self) else { return }
        router.navigateToDetails(for: presenter.characters[indexPath.row])
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = presenter.characters[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = character.name
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.characters.count
    }
}

// MARK: - Search methods

extension CharacterListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {

        guard let text = navigationItem.searchController?.searchBar.text else { return }

        searchTableViewController.results.removeAll()
        presenter.characters.forEach { character in
            if character.name.contains(text) {
                self.searchTableViewController.results.append(character.name)
            }
        }
        searchTableViewController.tableView.reloadData()
    }
}
