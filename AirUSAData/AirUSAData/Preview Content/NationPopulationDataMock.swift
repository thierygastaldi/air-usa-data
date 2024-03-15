//
//  NationPopulationDataMock.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

#if DEBUG

import Foundation

extension NationPopulationData {

    static var mock: NationPopulationData {

        let nationPopulation1 = NationPopulation(id: "1", nation: "USA", year: 2014, population: 1000)
        let nationPopulation2 = NationPopulation(id: "2", nation: "USA", year: 2015, population: 2000)

        return NationPopulationData(data: [nationPopulation1, nationPopulation2])
    }
}

#endif
