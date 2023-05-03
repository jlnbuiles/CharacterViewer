//
//  PathManager.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation

enum URLRoute {

    case characterList

    var path: String {

        let environment = AppEnvironment()

        switch self {
        case .characterList:
            switch environment {
            case .wire:
                return "?q=the+wire+characters&format=json"
            case .simpsons:
                return "?q=simpsons+characters&format=json"
            }
        }
    }
}

protocol URLRoutable {
    func route(_ route: URLRoute) -> URL?
}

struct BaseURLRouter: URLRoutable {

    static let baseURL = URL(string: "https://duckduckgo.com/")

    func route(_ route: URLRoute) -> URL? {
        URL(string: route.path, relativeTo: Self.baseURL)
    }
}
