//
//  NationViewModel+PopulationItem.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import Foundation

// MARK: - Auxiliar Models
extension NationViewModel {

    struct PopulationItem: Hashable, Equatable {

        let nation: String
        let popupation: String
        let year: String

        init(nation: String, popupation: String, year: String) {

            self.nation = nation
            self.popupation = popupation
            self.year = year
        }

        init(nationPopulation: NationPopulation) {

            self.nation = nationPopulation.nation
            self.popupation = String(nationPopulation.population/1000000) + " millions"
            self.year = String(nationPopulation.year)
        }

        static func == (lhs: PopulationItem, rhs: PopulationItem) -> Bool {

            return lhs.nation == rhs.nation && lhs.popupation == rhs.popupation && lhs.year == rhs.year
        }

        func hash(into hasher: inout Hasher) {

            hasher.combine(self.nation)
            hasher.combine(self.popupation)
            hasher.combine(self.year)
        }
    }
}
