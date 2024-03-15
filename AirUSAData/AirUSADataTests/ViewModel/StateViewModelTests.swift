//
//  StateViewModelTests.swift
//  AirUSADataTests
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import XCTest
@testable import AirUSAData

final class StateViewModelTests: XCTestCase {

    var stateService: StateServiceMock!
    var stateViewModel: StateViewModel!

    override func setUpWithError() throws {

        self.stateService = StateServiceMock()
        self.stateViewModel = StateViewModel(stateService: stateService)
    }

    func testPrepareGoesToLoadedStateOnSuccess() async {

        self.stateService.fetchStatePopulationDataStub = {

            let statePopulation1 = StatePopulation(id: "1", state: "Alabama", year: 2021, population: 1000)
            let statePopulation2 = StatePopulation(id: "2", state: "Texas", year: 2021, population: 2000)

            return StatePopulationData(data: [statePopulation1, statePopulation2])
        }

        XCTAssertEqual(self.stateViewModel.state, .loading)

        await self.stateViewModel.prepare()

        XCTAssertEqual(self.stateViewModel.state, .loaded)
        XCTAssertEqual(self.stateViewModel.populationItems.count, 2)
    }

    func testPrepareGoesToErrorStateOnError() async {

        self.stateService.fetchStatePopulationDataStub = {

            throw Networking.Error.unknownError("")
        }

        XCTAssertEqual(self.stateViewModel.state, .loading)

        await self.stateViewModel.prepare()

        XCTAssertEqual(self.stateViewModel.state, .error)
    }

    func testPrepareGoesToLoadedStateAfterRetry() async {

        self.stateService.fetchStatePopulationDataStub = {

            throw Networking.Error.unknownError("")
        }

        XCTAssertEqual(self.stateViewModel.state, .loading)

        await self.stateViewModel.prepare()

        XCTAssertEqual(self.stateViewModel.state, .error)

        self.stateService.fetchStatePopulationDataStub = {

            let statePopulation1 = StatePopulation(id: "1", state: "Alabama", year: 2021, population: 1000)
            let statePopulation2 = StatePopulation(id: "2", state: "Texas", year: 2021, population: 2000)

            return StatePopulationData(data: [statePopulation1, statePopulation2])
        }

        await self.stateViewModel.retry()

        XCTAssertEqual(self.stateViewModel.state, .loaded)
        XCTAssertEqual(self.stateViewModel.populationItems.count, 2)
    }
}
