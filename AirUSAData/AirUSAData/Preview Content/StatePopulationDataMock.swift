//
//  StatePopulationDataMock.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

#if DEBUG

import Foundation

extension StatePopulationData {

    static var mock: StatePopulationData {

        let statePopulation1 = StatePopulation(id: "1", state: "Alabama", year: 2021, population: 1000)
        let statePopulation2 = StatePopulation(id: "2", state: "Texas", year: 2021, population: 2000)

        return StatePopulationData(data: [statePopulation1, statePopulation2])
    }
}

#endif
