//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by David Hermann on 06.06.23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct WelcomeView: View {
    
    
    @EnvironmentObject var locationManager : LocationManager
    @State var isNight : Bool
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {

                Text("Welcome to Weathery")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                isNight ? (
                    
                    Image(systemName: "moon.stars.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 70)
                        .padding(.top, 20)
                    
                ) : (
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 70)
                        .padding(.top, 20)
                )
                
                VStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 42, height: 42)
                    Text("Please share your current location to get the weather in your area")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    LocationButton(.shareCurrentLocation) {
                        locationManager.requestLocation()
                    }.cornerRadius(10).foregroundColor(.white)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label:{
                    Text("Change Day Time")
                        .frame(width: 300, height: 50, alignment: .center)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
            }
            
        }
    }
}

