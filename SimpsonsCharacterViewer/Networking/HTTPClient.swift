//
//  HTTPClient.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation
import os

struct HTTPClient {

    private func GETRequest(with url: URL) -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }

    func getList() async -> Data? {
        guard let url = URLRouter.characterList,
              let request = GETRequest(with: url) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        } catch {
            Logger().error("Unable to complete request with error \(error)")
            return nil
        }
    }
}
