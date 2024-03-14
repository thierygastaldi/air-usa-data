//
//  PreviewNationService.swift
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

#endif
