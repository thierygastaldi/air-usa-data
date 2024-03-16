//
//  NationViewModelTests.swift
//  AirUSADataTests
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import XCTest
@testable import AirUSAData

final class NationViewModelTests: XCTestCase {

    var nationService: NationServiceMock!
    var nationViewModel: NationViewModel!

    override func setUpWithError() throws {

        self.nationService = NationServiceMock()
        self.nationViewModel = NationViewModel(nationService: nationService)
    }

    func testPrepareGoesToLoadedStateOnSuccess() async {

        self.nationService.fetchNationPopulationDataStub = {

            let nationPopulation1 = NationPopulation(id: "1", nation: "Alabama", year: 2021, population: 1000000)
            let nationPopulation2 = NationPopulation(id: "2", nation: "Texas", year: 2021, population: 20000000)

            return NationPopulationData(data: [nationPopulation1, nationPopulation2])
        }

        XCTAssertEqual(self.nationViewModel.state, .loading)

        await self.nationViewModel.prepare()

        XCTAssertEqual(self.nationViewModel.state, .loaded)
        XCTAssertEqual(self.nationViewModel.populationItems.count, 2)
        XCTAssertEqual(self.nationViewModel.populationItems[0].popupation, "One million")
        XCTAssertEqual(self.nationViewModel.populationItems[1].popupation, "~20 millions")
    }

    func testPrepareGoesToErrorStateOnError() async {

        self.nationService.fetchNationPopulationDataStub = {

            throw Networking.Error.unknownError("")
        }

        XCTAssertEqual(self.nationViewModel.state, .loading)

        await self.nationViewModel.prepare()

        XCTAssertEqual(self.nationViewModel.state, .error)
    }

    func testPrepareGoesToLoadedStateAfterRetry() async {

        self.nationService.fetchNationPopulationDataStub = {

            throw Networking.Error.unknownError("")
        }

        XCTAssertEqual(self.nationViewModel.state, .loading)

        await self.nationViewModel.prepare()

        XCTAssertEqual(self.nationViewModel.state, .error)

        self.nationService.fetchNationPopulationDataStub = {

            let nationPopulation1 = NationPopulation(id: "1", nation: "Alabama", year: 2021, population: 1000)
            let nationPopulation2 = NationPopulation(id: "2", nation: "Texas", year: 2021, population: 2000)

            return NationPopulationData(data: [nationPopulation1, nationPopulation2])
        }

        await self.nationViewModel.retry()

        XCTAssertEqual(self.nationViewModel.state, .loaded)
        XCTAssertEqual(self.nationViewModel.populationItems.count, 2)
    }
}
