//
//  UserMessage.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/26/23.
//

import Foundation

/**
 *  A centralized location for all human-readable strings.
 *
 *  This file should be expanded by creating a nested enum for each module.
 */
enum UserMessage {
    enum General {
        static let dismiss = NSLocalizedString("Dismiss", comment: "Dismiss title")
        static let unknownErrorBody = NSLocalizedString("We were unable to process the request. Please try again later.",
                                                        comment: "Unknown network request error body text")
        static let unknownErrorTitle = NSLocalizedString("Something went wrong",
                                                         comment: "Title for an unknown error")
    }
}

extension UserMessage {
    enum CharacterList {
        static let title = NSLocalizedString("Characters",
                                             comment: "The title for the character list view")
        static let noCharacters = NSLocalizedString("No characters to display",
                                                    comment: "There are no characters to display")
    }
}

extension UserMessage {
    enum Character {
        static let noName = NSLocalizedString("No name", comment: "Character has no name")
    }
}

extension UserMessage {
    enum CharacterDetail {
        static let noCharacterSelected = NSLocalizedString("No character was selected",
                                                           comment: "A character has not been selected info message")
    }
}
