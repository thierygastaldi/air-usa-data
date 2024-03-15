//
//  PreviewService.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

#if DEBUG

import Foundation

final class PreviewNationService: NationServiceProtocol {

    func fetchNationPopulationData() async throws -> NationPopulationData {

        NationPopulationData.mock
    }
}

final class PreviewStateService: StateServiceProtocol {

    func fetchStatePopulationData() async throws -> StatePopulationData {

        StatePopulationData.mock
    }
}

#endif
