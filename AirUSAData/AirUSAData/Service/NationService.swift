//
//  NationService.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import Foundation

protocol NationServiceProtocol {

    func fetchNationPopulationData() async throws -> NationPopulationData
}

final class NationService: NationServiceProtocol {

    private let networking: Networking

    init(networking: Networking) {

        self.networking = networking
    }

    func fetchNationPopulationData() async throws -> NationPopulationData {

        var components = URLComponents()
        components.scheme = "https"
        components.host = "datausa.io"
        components.path = "/api/data"

        let drilldownsQueryItem = URLQueryItem(name: "drilldowns", value: "Nation")
        let measuresQueryItem = URLQueryItem(name: "measures", value: "Population")
        components.queryItems = [drilldownsQueryItem, measuresQueryItem]

        guard let url = components.url else { preconditionFailure("Failed to construct URL") }

        let data: NationPopulationData = try await self.networking.get(url: url)

        return data
    }
}
