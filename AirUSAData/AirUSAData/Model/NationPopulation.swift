//
//  NationPopulation.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import Foundation

struct NationPopulation: Decodable, Hashable {

    let id: String
    let nation: String
    let year: Int
    let population: Int

    enum CodingKeys: String, CodingKey {

        case id = "ID Nation"
        case nation = "Nation"
        case year = "ID Year"
        case population = "Population"
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.nation = try container.decode(String.self, forKey: .nation)
        self.year = try container.decode(Int.self, forKey: .year)
        self.population = try container.decode(Int.self, forKey: .population)
    }
}
