//
//  IntegerExtensionTests.swift
//  AirUSADataTests
//
//  Created by Thiery Ribeiro on 16/03/2024.
//

import XCTest
@testable import AirUSAData

final class IntegerExtensionTests: XCTestCase {

    func testFormattedPoluation() {

        XCTAssertEqual(0.formattedPopulation, "Zero")
        XCTAssertEqual(1.formattedPopulation, "1")
        XCTAssertEqual(80.formattedPopulation, "80")
        XCTAssertEqual(100.formattedPopulation, "One hundred")
        XCTAssertEqual(455.formattedPopulation, "~4 hundreds")
        XCTAssertEqual(1000.formattedPopulation, "One thousand")
        XCTAssertEqual(999999.formattedPopulation, "~999 thousands")
        XCTAssertEqual(1000000.formattedPopulation, "One million")
        XCTAssertEqual(5040222.formattedPopulation, "~5 millions")
    }
}
