//
//  PathManager.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation

struct URLRouter {

    private static let environment = AppEnvironment()

    static var characterList: URL? {
        switch environment {
        case .wire:
            return URL(string: "?q=the+wire+characters&format=json", relativeTo: URLRouter.baseURL)
        case .simpsons:
            return URL(string: "?q=simpsons+characters&format=json", relativeTo: URLRouter.baseURL)
        }
    }

    static let baseURL = URL(string: "https://duckduckgo.com/")
}
