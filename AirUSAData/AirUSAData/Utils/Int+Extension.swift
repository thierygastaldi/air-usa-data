//
//  Int+Extension.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 16/03/2024.
//

import Foundation

extension Int {

    var formattedPopulation: String {

        switch self {

        case 0:
            return "Zero"

        case 1..<100:
            return "\(self)"

        case 100:
            return "One hundred"

        case 101..<1000:
            return "~\(self/100) hundreds"

        case 1000:
            return "One thousand"

        case 1001..<1000000:
            return "~\(self/1000) thousands"

        case 1000000:
            return "One million"

        case 1000001..<1000000000:
            return "~\(self/1000000) millions"

        default:
            return "\(self)"
        }
    }
}
