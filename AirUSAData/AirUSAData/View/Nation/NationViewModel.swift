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
    private(set) var populationItems: [PopulationItem] = []
    var state: State = .loading

    init(nationService: NationServiceProtocol) {

        self.nationService = nationService
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
extension NationViewModel {

    enum State {

        case error
        case loaded
        case loading
    }
}

// MARK: - Private
private extension NationViewModel {

    func fetchData() async {

        do {

            let data = try await self.nationService.fetchNationPopulationData().data

            self.populationItems = data.compactMap { PopulationItem(nationPopulation: $0) }

            self.state = .loaded

        } catch {

            self.state = .error
        }
    }
}
