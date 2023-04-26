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
        static let dismiss = NSLocalizedString("Dismiss", comment: "")
        static let unknownErrorBody = NSLocalizedString("We were unable to process the request. Please try again later.", comment: "")
        static let unknownErrorTitle = NSLocalizedString("Something went wrong", comment: "")
    }
}
