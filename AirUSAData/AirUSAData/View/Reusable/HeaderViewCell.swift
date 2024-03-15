//
//  HeaderViewCell.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

struct HeaderViewCell: View {

    private let leftTitle: String
    private let centerTitle: String
    private let rightTitle: String

    var body: some View {
        HStack {

            VStack(alignment: .leading) {
                Text(self.leftTitle)
            }.padding()

            Spacer()

            VStack(alignment: .trailing) {
                Text(self.rightTitle)
            }.padding()
        }
        .overlay {
            HStack {
                Text(self.centerTitle)
            }
        }
        .background(Color.cyan.opacity(0.6))
        .cornerRadius(15)
        .padding(EdgeInsets(top: 0.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
    }

    init(leftTitle: String, centerTitle: String, rightTitle: String) {

        self.leftTitle = leftTitle
        self.centerTitle = centerTitle
        self.rightTitle = rightTitle
    }
}

#Preview {
    HeaderViewCell(leftTitle: "Nation", centerTitle: "Year", rightTitle: "")
}
