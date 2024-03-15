//
//  StateService.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import Foundation

protocol StateServiceProtocol {

    func fetchStatePopulationData() async throws -> StatePopulationData
}

final class StateService: StateServiceProtocol {

    private let networking: Networking

    init(networking: Networking) {

        self.networking = networking
    }

    func fetchStatePopulationData() async throws -> StatePopulationData {

        var components = URLComponents()
        components.scheme = "https"
        components.host = "datausa.io"
        components.path = "/api/data"

        let drilldownsQueryItem = URLQueryItem(name: "drilldowns", value: "State")
        let measuresQueryItem = URLQueryItem(name: "measures", value: "Population")
        let yearQueryItem = URLQueryItem(name: "year", value: "latest")
        components.queryItems = [drilldownsQueryItem, measuresQueryItem, yearQueryItem]

        guard let url = components.url else { preconditionFailure("Failed to construct URL") }

        let data: StatePopulationData = try await self.networking.get(url: url)

        return data
    }
}
