//
//  NetworkError.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 5/2/23.
//

import Foundation

enum NetworkError: AppError {

    case unknown(context: String)

    var description: String {
        switch self {
        case .unknown(let context): return "An unknown network error ocurred. Context \(context)"
        }
    }
}
