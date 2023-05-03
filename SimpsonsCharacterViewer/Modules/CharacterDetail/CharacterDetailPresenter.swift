//
//  CharacterDetailPresenter.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import Foundation

protocol CharacterDetailPresentable {
    var character: Character? { get set }
    var publisher: Published<Character?>.Publisher { get }
}

/**
 *  Because of the simplicity of the view contoller this presenter may not be necessary, but I did it to maintain consistency and the overall architecture.
 *
 *  However, I am omitting the interactor entirely since we won't be making any requests.
 */
final class CharacterDetailPresenter: CharacterDetailPresentable {

    var publisher: Published<Character?>.Publisher { $character }
    @Published var character: Character?

    init(character: Character? = nil) {
        self.character = character
    }
}
