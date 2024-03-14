//
//  Networking+Error.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import Foundation

extension Networking {

    enum Error: LocalizedError {

        case decodingError(String?)
        case serverError(String?)
        case unknownError(String?)
    }
}
