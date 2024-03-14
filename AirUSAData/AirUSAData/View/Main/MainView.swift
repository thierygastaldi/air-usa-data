//
//  MainView.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

struct MainView: View {

    private let nationViewModel: NationViewModel

    var body: some View {
        TabView {
            NationView(viewModel: self.nationViewModel).tabItem {
                Label("Nation", systemImage: "flag.2.crossed.circle.fill")
            }
        }
    }

    init(nationViewModel: NationViewModel) {
        self.nationViewModel = nationViewModel
    }
}

#Preview {
    let service = PreviewNationService()
    let nationViewModel = NationViewModel(nationService: service)
    return MainView(nationViewModel: nationViewModel)
}
