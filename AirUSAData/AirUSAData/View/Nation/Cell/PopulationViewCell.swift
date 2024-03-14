//
//  PopulationViewCell.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

struct PopulationViewCell: View {

    let viewModel: PopulationCellViewModel

    var body: some View {
        HStack {

            VStack(alignment: .leading) {
                Text(Image(systemName: "flag.2.crossed.circle.fill"))
                Text("\(viewModel.nation)")
            }.padding()

            Spacer()

            VStack(alignment: .leading) {
                Text(Image(systemName: "person.3.sequence.fill"))
                Text("\(viewModel.popupation)")
            }.padding()
        }
        .overlay {
            HStack {
                Text("\(viewModel.year)")
            }
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
    }

    init(viewModel: PopulationCellViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    let viewModel = PopulationCellViewModel(nation: "Portugal", popupation: "1000", year: "2024")
    return PopulationViewCell(viewModel: viewModel)
}
