//
//  HTTPClient.swift
//  SimpsonsCharacterViewer
//
//  Created by Julian Builes on 4/24/23.
//

import Foundation
import os

struct HTTPClient {

    private func baseGETRequest() -> URLRequest? {

        guard let url = URLRouter.baseURL else { return nil }

        // temp: maybe pass these as arguments and find a more structured way to represent them
        let queryParams: [URLQueryItem] = [
            .init(name: "q", value: "simpsons+characters"),
            .init(name: "format", value: "json")
        ]

        var request = URLRequest(url: url.appending(queryItems: queryParams))

        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        return request
    }

    func getList() async -> Data? {

        guard let request = baseGETRequest() else { return nil }

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        } catch {
            Logger().error("Unable to complete request with error \(error)")
            return nil
        }
    }
}
