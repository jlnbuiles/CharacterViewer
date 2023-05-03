//
//  CharacterListPresenter.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation

protocol CharacterListPresentable {
    func getCharacters() async -> Result<[Character], Error>
    var characters: [Character]? { get }
    var publisher: Published<[Character]?>.Publisher { get }
}

final class CharacterListPresenter: CharacterListPresentable {

    var publisher: Published<[Character]?>.Publisher { $characters }
    let interactor: CharacterListInteractor
    @Published var characters: [Character]?

    required init(interactor: CharacterListInteractor = CharacterListInteractor()) {
        self.interactor = interactor
    }

    func getCharacters() async -> Result<[Character], Error> {
        do {
            switch try await interactor.fetchCharacters() {
            case .failure(let error):
                return .failure(error)
            case .success(let characters):
                self.characters = characters
                return .success(characters)
            }
        } catch {
            return .failure(error)
        }
    }
}
