//
//  PopulationHeaderViewCell.swift
//  AirUSAData
//
//  Created by Thiery Ribeiro on 14/03/2024.
//

import SwiftUI

struct PopulationHeaderViewCell: View {

    var body: some View {
        HStack {

            VStack(alignment: .leading) {
                Text("Nation")
            }.padding()

            Spacer()

            VStack(alignment: .leading) {
                Text("Population")
            }.padding()
        }
        .overlay {
            HStack {
                Text("Year")
            }
        }
        .background(Color.gray.opacity(0.7))
        .cornerRadius(15)
        .padding(EdgeInsets(top: 0.0, leading: 16.0, bottom: 8.0, trailing: 16.0))
    }
}

#Preview {
    PopulationHeaderViewCell()
}
