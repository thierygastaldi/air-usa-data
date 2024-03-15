//
//  StateViewModel.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import Foundation

@Observable
class StateViewModel {

    private let stateService: StateServiceProtocol
    private(set) var populationItems: [PopulationItem] = []
    var state: State = .loading

    init(stateService: StateServiceProtocol) {

        self.stateService = stateService
    }

    func prepare() async {

        await self.fetchData()
    }

    func retry() async {

        self.state = .loading

        await self.fetchData()
    }
}

// MARK: - View State
extension StateViewModel {

    enum State {

        case error
        case loaded
        case loading
    }
}

// MARK: - Private
private extension StateViewModel {

    func fetchData() async {

        do {

            let data = try await self.stateService.fetchStatePopulationData().data

            self.populationItems = data.compactMap { PopulationItem(statePopulation: $0) }

            self.state = .loaded

        } catch {

            self.state = .error
        }
    }
}
