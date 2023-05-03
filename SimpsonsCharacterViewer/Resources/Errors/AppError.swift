//
//  AppError.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 5/2/23.
//

import Foundation

/**
    The severity of an error.
*/
enum Severity: Int {
    case low, normal, high
}

/**
 *  The basis for representing any error in the app.
 */
protocol AppError: CustomStringConvertible, Error {

    /**
        The severity of an error.

        `HCSSError`s have a `.low` priority by default.
    */
    var severity: Severity { get }

    /**
        The domain or namespace for a specific error.

        Defaults to the enum name by default. e.g. `CustomError`, `HCSSNetworkError`, etc.
    */
    static var domain: String { get }
}

extension AppError {
    var severity: Severity { .low }
    static var domain: String { String(describing: Self.self) }
}
