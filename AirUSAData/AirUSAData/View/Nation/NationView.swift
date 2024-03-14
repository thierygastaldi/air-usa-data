//
//  NationView.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

struct NationView: View {
    
    @State private var viewModel: NationViewModel

    var body: some View {

        NavigationStack {

            switch self.viewModel.state {

            case .error:
                Text("Error! Please, try again later.")

            case .loaded:

                ScrollView(.vertical, showsIndicators: false) {

                    PopulationHeaderViewCell()

                    LazyVStack {
                        ForEach(self.viewModel.populationViewModelData, id: \.self) { populationViewModel in

                            PopulationViewCell(viewModel: populationViewModel)
                        }
                    }
                }

            case .loading:
                ProgressView()
            }
        }
        .task { await self.viewModel.prepare() }
    }

    init(viewModel: NationViewModel) {

        self.viewModel = viewModel
    }
}

#Preview {
    let service = PreviewNationService()
    let viewModel = NationViewModel(nationService: service)
    return NationView(viewModel: viewModel)
}
