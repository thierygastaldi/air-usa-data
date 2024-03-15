//
//  StateServiceMock.swift
//  AirUSADataTests
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import Foundation
@testable import AirUSAData

class StateServiceMock: StateServiceProtocol {

    var fetchStatePopulationDataStub: (() async throws -> StatePopulationData)? = nil

    func fetchStatePopulationData() async throws -> StatePopulationData {

        try await self.fetchStatePopulationDataStub!()
    }
}
