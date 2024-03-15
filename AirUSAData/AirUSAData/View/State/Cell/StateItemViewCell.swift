//
//  StateItemViewCell.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import SwiftUI

struct StateItemViewCell: View {

    let populationItem: StateViewModel.PopulationItem

    var body: some View {
        HStack {

            HStack() {
                Text(Image(systemName: "poweroutlet.type.a"))
                Text("\(populationItem.state)")
            }.padding()

            Spacer()

            HStack() {
                Text("\(populationItem.popupation)")
                Text(Image(systemName: "person.3.sequence.fill"))
            }.padding()
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
    }

    init(populationItem: StateViewModel.PopulationItem) {

        self.populationItem = populationItem
    }
}

#Preview {
    let populationItem = StateViewModel.PopulationItem(nation: "Alabama", popupation: "2000")
    return StateItemViewCell(populationItem: populationItem)
}
