//
//  NationServiceMock.swift
//  AirUSADataTests
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import Foundation
@testable import AirUSAData

class NationServiceMock: NationServiceProtocol {

    var fetchNationPopulationDataStub: (() async throws -> NationPopulationData)? = nil

    func fetchNationPopulationData() async throws -> NationPopulationData {

        try await self.fetchNationPopulationDataStub!()
    }
}
