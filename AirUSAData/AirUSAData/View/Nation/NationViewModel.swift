//
//  NationViewModel.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import Foundation

@Observable
class NationViewModel {

    private let nationService: NationServiceProtocol

    // View State
    var state: State = .loading

    // View Model Data
    private(set) var populationViewModelData: [PopulationCellViewModel] = []

    init(nationService: NationServiceProtocol) {

        self.nationService = nationService
    }

    func prepare() async {

        do {

            let nationPopulationData = try await self.nationService.fetchNationPopulationData().data

            self.populationViewModelData = nationPopulationData.compactMap { PopulationCellViewModel(nationPopulation: $0) }

            self.state = .loaded

        } catch {

            self.state = .error
        }
    }
}

extension NationViewModel {

    enum State {

        case error
        case loaded
        case loading
    }
}
