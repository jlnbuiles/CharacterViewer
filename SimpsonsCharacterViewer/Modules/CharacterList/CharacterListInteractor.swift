//
//  CharacterListInteractor.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation
import os

protocol CharacterListInteractorProtocol {
    func fetchCharacters() async -> [Character]?
}

struct CharacterListInteractor: CharacterListInteractorProtocol {

    func fetchCharacters() async -> [Character]? {

        guard let results = await HTTPClient().getList() else { return nil }

        do {
            return try JSONDecoder().decode(DuckDuckGoResponse.self, from: results).items
        } catch {
            Logger().error("Unable to decode with error \(error)")
            return nil
        }
    }
}
