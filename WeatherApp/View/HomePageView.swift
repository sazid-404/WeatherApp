//
//  HomePageView.swift
//  WeatherApp
//
//  Created by Sazzadul Islam on 9/12/25.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Text("Irving, TX")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding(.top)
                
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("70° F")
                    .font(.system(size: 70, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding(.bottom)
                Text("sunny day")
                    .font(.system(size: 25, weight: .medium, design: .default))
                    .padding(.bottom)
                HStack {
                    Text("H: 75°").padding(.trailing)
                    Text("L: 70°")
                }
                Spacer()
                
                VStack {
                    HStack {
                        Text("Hourly Forecust")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
                Spacer()
                
               
            }
        }
    }
}

#Preview {
    HomePageView()
}
