//
//  CharacterListInteractor.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation
import os

protocol CharacterListInteractorProtocol {
    func fetchCharacters() async throws -> Result<[Character], Error>
}

struct CharacterListInteractor: CharacterListInteractorProtocol {

    func fetchCharacters() async throws -> Result<[Character], Error> {
        do {
            guard let results = try await HTTPClient().get(.characterList) else {
                return .failure(NetworkError.unknown(context: URLRoute.characterList.path))
            }

            return Result {
                do {
                    return try JSONDecoder().decode(DuckDuckGoResponse.self, from: results).items
                } catch {
                    Logger().error("Unable to decode with error \(error)")
                    throw error
                }
            }
        }
    }
}
