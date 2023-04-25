//
//  DuckDuckGoResponse.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation

struct DuckDuckGoResponse: Decodable {

    enum CodingKeys: String, CodingKey {
        case items = "RelatedTopics"
    }

    var items: [Character]
}

struct Icon: Decodable {

    enum CodingKeys: String, CodingKey {
        case imagePath = "URL"
    }
    let imagePath: String
}
