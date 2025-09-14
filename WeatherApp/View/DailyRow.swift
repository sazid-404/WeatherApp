//
//  DailyRow.swift
//  WeatherApp
//
//  Created by Sazzadul Islam on 9/13/25.
//

import SwiftUI

struct DailyRow: View {
    let day: DailyForecast

    var body: some View {
        HStack {
            Text(day.day)
                .font(.body)
                .frame(width: 110, alignment: .leading)

            Image(systemName: day.condition.sfSymbol)
                .symbolRenderingMode(.multicolor)
                .frame(width: 28)

            Spacer()

            Text("\(day.high)°")
                .font(.body).bold()
                .frame(width: 40, alignment: .trailing)

            Text("\(day.low)°")
                .font(.body)
                .foregroundStyle(.secondary)
                .frame(width: 40, alignment: .trailing)
        }
    }
}


//#Preview {
//    DailyRow()
//}
