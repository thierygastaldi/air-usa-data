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
                ErrorView(retryButtonAction: { Task { await self.viewModel.retry() } })

            case .loaded:
                HeaderViewCell(leftTitle: "Nation", centerTitle: "Year", rightTitle: "Population")

                ScrollView(.vertical, showsIndicators: false) {

                    LazyVStack {
                        ForEach(self.viewModel.populationItems, id: \.self) { item in

                            NationItemViewCell(populationItem: item)
                        }
                    }
                }
                .navigationTitle("Nation Data")
                .navigationBarTitleDisplayMode(.inline)

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
