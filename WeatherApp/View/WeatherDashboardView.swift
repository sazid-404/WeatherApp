//
//  WeatherDashboardView.swift
//  WeatherApp
//
//  Created by Sazzadul Islam on 9/13/25.
//

import SwiftUI

// MARK: - Screen

struct WeatherDashboardView: View {
    // Replace these with data from your location + API later
    let city = "San Francisco, CA"
    let currentTemp = 68
    let currentHigh = 72
    let currentLow = 60
    let currentCondition: WeatherCondition = .partlyCloudy
    let hourly = mockHourly
    let daily = mockDaily

    // Selection for the faux bottom nav
    @State private var tab: Tab = .current
    enum Tab { case current, radar, forecast }

    var body: some View {
        ZStack {
            // Background sky gradient
            LinearGradient(
                colors: [Color.orange.opacity(0.35), Color.blue.opacity(0.35)],
                startPoint: .top, endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    topBar

                    mainCurrentBlock

                    hourlySection

                    dailySection
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 100) // leave room for bottom bar
            }
        }
        .safeAreaInset(edge: .bottom) {
            bottomBar
                .background(.ultraThinMaterial)
        }
    }

    // MARK: - Top Bar

    var topBar: some View {
        HStack {
            Button {
                // open settings / drawer
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.title2)
                    .padding(10)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
            }

            Spacer()

            Button {
                // change location
            } label: {
                Text(city)
                    .font(.headline)
                    .foregroundStyle(.primary)
            }

            Spacer()

            Button {
                // add new location
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .padding(10)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(.top, 8)
    }

    // MARK: - Main Current

    var mainCurrentBlock: some View {
        VStack(spacing: 8) {
            Image(systemName: currentCondition.sfSymbol)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 80))

            Text("\(currentTemp)°F")
                .font(.system(size: 64, weight: .bold, design: .rounded))

            Text(currentCondition.description)
                .font(.title3)
                .foregroundStyle(.secondary)

            Text("H: \(currentHigh)°   L: \(currentLow)°")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(.ultraThinMaterial)
        )
    }

    // MARK: - Hourly

    var hourlySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("HOURLY FORECAST")
                .font(.subheadline).bold()
                .foregroundStyle(.secondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(hourly.indices, id: \.self) { i in
                        HourCard(hour: hourly[i], isEmphasized: i == 0)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Daily

    var dailySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("DAILY FORECAST")
                .font(.subheadline).bold()
                .foregroundStyle(.secondary)

            VStack(spacing: 8) {
                ForEach(daily) { day in
                    DailyRow(day: day)
                    if day.id != daily.last?.id {
                        Divider().opacity(0.25)
                    }
                }
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(.ultraThinMaterial)
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Bottom Bar

    var bottomBar: some View {
        HStack(spacing: 24) {
            BottomItem(icon: "circle", title: "Current", isSelected: tab == .current) {
                tab = .current
            }
            BottomItem(icon: "wave.3.right.circle", title: "Radar", isSelected: tab == .radar) {
                tab = .radar
            }
            BottomItem(icon: "calendar", title: "Forecast", isSelected: tab == .forecast) {
                tab = .forecast
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 10)
    }
}


//#Preview {
//    WeatherDashboardView()
//}

// MARK: - Preview

struct WeatherDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDashboardView()
            .preferredColorScheme(.light)
        WeatherDashboardView()
            .preferredColorScheme(.dark)
    }
}
