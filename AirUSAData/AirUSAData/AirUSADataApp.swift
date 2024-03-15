//
//  AirUSADataApp.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

@main
struct AirUSADataApp: App {

    var body: some Scene {
        WindowGroup {

            let networking = Networking()

            // Nation
            let nationService = NationService(networking: networking)
            let nationViewModel = NationViewModel(nationService: nationService)

            // State
            let stateService = StateService(networking: networking)
            let stateViewModel = StateViewModel(stateService: stateService)

            MainView(nationViewModel: nationViewModel, stateViewModel: stateViewModel)
        }
    }
}
