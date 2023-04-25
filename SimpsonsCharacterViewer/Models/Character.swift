//
//  Character.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation

struct Character: Decodable {

    // MARK: - Attributes

    var name: String
    var description: String
    var imageURL: URL?

    enum CodingKeys: String, CodingKey {
        case name
        case description = "Text"
        case imageURL = "Icon"
    }

    // MARK: - Viewable protocol

//    var titleText: String { name }

    // MARK: - Initializer

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
        // Having a temporary fallback text of `No name` for now.
        // But it seems like this should always be present
        self.name = self.description.components(separatedBy: " - ").first ?? "No name"
        let imagePath = try container.decode(Icon.self, forKey: .imageURL).imagePath
        self.imageURL = URL(string: imagePath, relativeTo: URLRouter.baseURL)
    }
}
