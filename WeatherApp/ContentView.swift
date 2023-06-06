//
//  ContentView.swift
//  WeatherApp
//
//  Created by David Hermann on 05.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight = false;
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    
    var body: some View {
        ZStack  {
            BackgroundView(isNight: $isNight)
            VStack {
                if let currentWeather = weatherAPIClient.currentWeather {
                    CityName(city: currentWeather.weatherCode.description)
                    MainStatusView(icon: currentWeather.weatherCode.image,
                                   temperature: currentWeather.temperature)
                    
                    Spacer()
                    HStack(spacing: 25) {
                        WeatherDay(day: "TUE", iconName: "sun.max.fill", temperature: "23")
                        WeatherDay(day: "WED", iconName: "cloud.fill", temperature: "22")
                        WeatherDay(day: "THU", iconName: "cloud.rain.fill", temperature: "23")
                        WeatherDay(day: "FRI", iconName: "sun.max.fill", temperature: "25")
                        WeatherDay(day: "SAT", iconName: "cloud.sun.fill", temperature: "26")
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
                    
                    Spacer()
                } else {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 42, height: 42)
                        .padding(20)
                    Text("No weather info available yet.\nTap on refresh to fetch new data.\nMake sure you have enabled location permissions for the app.")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    Button("Refresh", action: {
                        Task {
                            await weatherAPIClient.fetchWeather()
                        }
                    }).frame(width: 300, height: 50, alignment: .center)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDay: View {
    
    var day : String
    var iconName : String
    var temperature : String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(day)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 42, height: 42)
            Text("\(temperature)°C")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight : Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .white : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityName: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct MainStatusView: View {
    
    var icon : Image
    var temperature : Int
    
    var body: some View {
        VStack(spacing: 10) {
            icon
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            Text("\(temperature)°C")
                .font(.system(size: 64, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}
