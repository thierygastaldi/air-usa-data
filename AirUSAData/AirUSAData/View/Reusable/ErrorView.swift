//
//  ErrorView.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 16/03/2024.
//

import SwiftUI

struct ErrorView: View {

    let retryButtonAction: (() -> Void)

    var body: some View {
        VStack {

            Text("Error! Please, try again...")

            Button("Retry") {
                self.retryButtonAction()
            }
            .buttonStyle(.borderedProminent)
            .padding(16)
        }
    }

    init(retryButtonAction: @escaping () -> Void) {

        self.retryButtonAction = retryButtonAction
    }
}

#Preview {
    let buttonAction = {}
    return ErrorView(retryButtonAction: buttonAction)
}
