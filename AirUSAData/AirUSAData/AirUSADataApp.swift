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
            let nationService = NationService(networking: networking)
            let nationViewModel = NationViewModel(nationService: nationService)

            MainView(nationViewModel: nationViewModel)
        }
    }
}
