//
//  HourCard.swift
//  WeatherApp
//
//  Created by Sazzadul Islam on 9/13/25.
//

import SwiftUI

// MARK: - Components

struct HourCard: View {
    let hour: HourlyForecast
    var isEmphasized: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            Text(hour.hour)
                .font(.caption).bold()
            Image(systemName: hour.condition.sfSymbol)
                .symbolRenderingMode(.multicolor)
                .font(.title3)
            Text("\(hour.temp)°")
                .font(.headline)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 14)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(isEmphasized ? Color.blue.opacity(0.2) : Color.clear)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        )
    }
}


//#Preview {
//    HourCard()
//}
