//
//  Environment.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/25/23.
//

import Foundation

/**
    Represents the environment the app is running on.

    The value is deternined dynamically when `init()` is called via the schema configuration.
 */
enum AppEnvironment: String, CustomStringConvertible {

    case simpsons, wire

    var description: String { rawValue }

    init() {
        #if WIRE
            self = .wire
        #elseif SIMPSONS
            self = .simpsons
        #endif
    }
}
