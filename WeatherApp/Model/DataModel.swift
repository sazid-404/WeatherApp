//
//  DataModel.swift
//  WeatherApp
//
//  Created by Sazzadul Islam on 9/13/25.
//



import SwiftUI

// MARK: - Models

enum WeatherCondition: String, CaseIterable {
    case clear, partlyCloudy, cloudy, rain, snow

    var sfSymbol: String {
        switch self {
        case .clear:         return "sun.max.fill"
        case .partlyCloudy:  return "cloud.sun.fill"
        case .cloudy:        return "cloud.fill"
        case .rain:          return "cloud.rain.fill"
        case .snow:          return "cloud.snow.fill"
        }
    }

    var description: String {
        switch self {
        case .clear:         return "Clear"
        case .partlyCloudy:  return "Partly Cloudy"
        case .cloudy:        return "Cloudy"
        case .rain:          return "Rain"
        case .snow:          return "Snow"
        }
    }
}

struct HourlyForecast: Identifiable {
    let id = UUID()
    let hour: String   // e.g., "2 PM"
    let temp: Int
    let condition: WeatherCondition
}

struct DailyForecast: Identifiable {
    let id = UUID()
    let day: String    // e.g., "Monday"
    let high: Int
    let low: Int
    let condition: WeatherCondition
}

// MARK: - Mock Data

let mockHourly: [HourlyForecast] = [
    .init(hour: "2 PM", temp: 70, condition: .clear),
    .init(hour: "3 PM", temp: 69, condition: .partlyCloudy),
    .init(hour: "4 PM", temp: 68, condition: .cloudy),
    .init(hour: "5 PM", temp: 65, condition: .rain),
    .init(hour: "6 PM", temp: 63, condition: .rain),
    .init(hour: "7 PM", temp: 61, condition: .cloudy),
]

let mockDaily: [DailyForecast] = [
    .init(day: "Monday",    high: 72, low: 60, condition: .clear),
    .init(day: "Tuesday",   high: 70, low: 58, condition: .partlyCloudy),
    .init(day: "Wednesday", high: 68, low: 55, condition: .rain),
    .init(day: "Thursday",  high: 65, low: 48, condition: .cloudy),
    .init(day: "Friday",    high: 63, low: 47, condition: .cloudy),
    .init(day: "Saturday",  high: 62, low: 56, condition: .partlyCloudy),
    .init(day: "Sunday",    high: 64, low: 54, condition: .clear),
]
