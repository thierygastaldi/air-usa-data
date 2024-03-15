//
//  StatePopulation.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import Foundation

struct StatePopulation: Decodable, Hashable {

    let id: String
    let state: String
    let year: Int
    let population: Int

    enum CodingKeys: String, CodingKey {

        case id = "ID State"
        case state = "State"
        case year = "ID Year"
        case population = "Population"
    }

    init(id: String, state: String, year: Int, population: Int) {

        self.id = id
        self.state = state
        self.year = year
        self.population = population
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.state = try container.decode(String.self, forKey: .state)
        self.year = try container.decode(Int.self, forKey: .year)
        self.population = try container.decode(Int.self, forKey: .population)
    }
}
