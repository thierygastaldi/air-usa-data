//
//  StateViewModel+PopulationItem.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import Foundation

// MARK: - Auxiliar Models
extension StateViewModel {

    struct PopulationItem: Hashable, Equatable {

        let state: String
        let popupation: String

        init(nation: String, popupation: String) {

            self.state = nation
            self.popupation = popupation
        }

        init(statePopulation: StatePopulation) {

            self.state = statePopulation.state
            self.popupation = statePopulation.population.formattedPopulation
        }

        static func == (lhs: PopulationItem, rhs: PopulationItem) -> Bool {

            return lhs.state == rhs.state && lhs.popupation == rhs.popupation
        }

        func hash(into hasher: inout Hasher) {

            hasher.combine(self.state)
            hasher.combine(self.popupation)
        }
    }
}
