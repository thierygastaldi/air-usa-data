//
//  MainView.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

struct MainView: View {

    private let nationViewModel: NationViewModel
    private let stateViewModel: StateViewModel

    var body: some View {
        TabView {

            NationView(viewModel: self.nationViewModel).tabItem {
                Label("Nation", systemImage: "flag.2.crossed.circle.fill")
            }

            StateView(viewModel: self.stateViewModel).tabItem {
                Label("State", systemImage: "poweroutlet.type.a")
            }
        }
    }

    init(nationViewModel: NationViewModel, stateViewModel: StateViewModel) {

        self.nationViewModel = nationViewModel
        self.stateViewModel = stateViewModel
    }
}

#Preview {
    let nationService = PreviewNationService()
    let nationViewModel = NationViewModel(nationService: nationService)
    let stateService = PreviewStateService()
    let stateViewModel = StateViewModel(stateService: stateService)
    return MainView(nationViewModel: nationViewModel, stateViewModel: stateViewModel)
}
