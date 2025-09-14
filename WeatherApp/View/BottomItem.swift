//
//  BottomItem.swift
//  WeatherApp
//
//  Created by Sazzadul Islam on 9/13/25.
//

import SwiftUI

struct BottomItem: View {
    
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                Image(systemName: icon)
                    .font(.title3)
                Text(title)
                    .font(.caption2)
            }
            .foregroundStyle(isSelected ? .primary : .secondary)
            .padding(.horizontal, 8)
            .padding(.vertical, 6)
            .background(
                isSelected
                ? AnyShapeStyle(.ultraThinMaterial)
                : AnyShapeStyle(Color.clear)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }
}

//#Preview {
//    BottomItem()
//}
