//
//  WeatherView.swift
//  WeatherApp
//
//  Created by David Hermann on 06.06.23.
//

import SwiftUI
import CoreLocationUI

struct WeatherView: View {
    var weather : ResponseBody
    
    @EnvironmentObject var locationManager : LocationManager
    @State var isNight : Bool
    
    var body: some View {

        ZStack  {
            BackgroundView(isNight: $isNight)
            VStack {
                if let weatherResponse = weather.weather.first {
                    let weatherIcon = Image(systemName: getImageBasedOnWeather(weatherString: weatherResponse.id))
                    CityName(city: weather.name)
                    MainStatusView(icon: weatherIcon,
                                   temperature: weather.main.temp.roundDouble())
                } else {
                    CityName(city: weather.name)
                    MainStatusView(icon: Image(systemName: getImageBasedOnWeather(weatherString: 0)),
                                   temperature: weather.main.temp.roundDouble())
                }
                
                Spacer()
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .bold()
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "thermometer.low", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                            Spacer()
                            WeatherRow(logo: "thermometer.high", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                        }
                        
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.all)
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
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

struct CityName: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.title).bold()
            .foregroundColor(.white)
            .padding()
            .multilineTextAlignment(.center)
    }
}

struct MainStatusView: View {
    
    var icon : Image
    var temperature : String
    
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

/*struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
*/
