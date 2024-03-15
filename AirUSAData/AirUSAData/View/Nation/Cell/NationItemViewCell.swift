//
//  NationItemViewCell.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

struct NationItemViewCell: View {

    let populationItem: NationViewModel.PopulationItem

    var body: some View {
        HStack {

            VStack(alignment: .leading) {
                Text(Image(systemName: "flag.2.crossed.circle.fill"))
                Text("\(populationItem.nation)")
            }.padding()

            Spacer()

            VStack(alignment: .trailing) {
                Text(Image(systemName: "person.3.sequence.fill"))
                Text("\(populationItem.popupation)")
            }.padding()
        }
        .overlay {
            HStack {
                Text("\(populationItem.year)")
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
    }

    init(populationItem: NationViewModel.PopulationItem) {
        self.populationItem = populationItem
    }
}

#Preview {
    let populationItem = NationViewModel.PopulationItem(nation: "Portugal", popupation: "1000", year: "2024")
    return NationItemViewCell(populationItem: populationItem)
}
