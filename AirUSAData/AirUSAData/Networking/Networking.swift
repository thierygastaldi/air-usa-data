//
//  Networking.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import Foundation

final class Networking {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get<T: Decodable>(url: URL) async throws -> T {

        try await withCheckedThrowingContinuation { continuation in

            let dataTask = session.dataTask(with: url) { data, response, error in

                if let error {

                    continuation.resume(throwing: Error.unknownError(error.localizedDescription))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {

                    continuation.resume(throwing: Error.serverError("Server bad response"))
                    return
                }

                guard let data else {

                    continuation.resume(throwing: Error.unknownError("Invalid success response"))
                    return
                }

                do {

                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    continuation.resume(returning: decodedData)

                } catch {

                    continuation.resume(throwing: Error.decodingError(error.localizedDescription))
                }
            }

            dataTask.resume()
        }
    }
}
