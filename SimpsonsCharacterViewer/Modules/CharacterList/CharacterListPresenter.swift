//
//  CharacterListPresenter.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation

protocol CharacterListPresentable {
    func getCharacters()
    var characters: [Character]? { get }
    var publisher: Published<[Character]?>.Publisher { get }
}

final class CharacterListPresenter: CharacterListPresentable {

    var publisher: Published<[Character]?>.Publisher { $characters }
    let interactor: CharacterListInteractor
    @Published var characters: [Character]?

    init(interactor: CharacterListInteractor = CharacterListInteractor()) {
        self.interactor = interactor
    }

    func getCharacters() {
        Task {
            guard let chars = await interactor.fetchCharacters() else { return }
            self.characters = chars
        }
    }
}
