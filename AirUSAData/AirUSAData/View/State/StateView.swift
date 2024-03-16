//
//  StateView.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 15/03/2024.
//

import SwiftUI

struct StateView: View {

    @State private var viewModel: StateViewModel

    var body: some View {
        NavigationStack {

            switch self.viewModel.state {

            case .error:
                ErrorView(retryButtonAction: { Task { await self.viewModel.retry() } })

            case .loaded:
                HeaderViewCell(leftTitle: "State", centerTitle: "", rightTitle: "Population")

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(self.viewModel.populationItems, id: \.self) { item in

                            StateItemViewCell(populationItem: item)
                        }
                    }
                }
                .navigationTitle("State Data")
                .navigationBarTitleDisplayMode(.inline)

            case .loading:
                ProgressView()
            }
        }
        .task { await self.viewModel.prepare() }
    }

    init(viewModel: StateViewModel) {

        self.viewModel = viewModel
    }
}

#Preview {
    let service = PreviewStateService()
    let viewModel = StateViewModel(stateService: service)
    return StateView(viewModel: viewModel)
}
