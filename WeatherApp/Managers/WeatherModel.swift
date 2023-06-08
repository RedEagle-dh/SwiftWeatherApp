//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by David Hermann on 05.06.23.
//

import Foundation
import CoreLocation
import SwiftUI

func getImageBasedOnWeather(weatherString: Int) -> String {
    
    
    switch weatherString {
        
        // Thunderstorm ID 2XX
    case 200: return "cloud.bolt.fill"
    case 201 : return "cloud.bolt.rain.fill"
    case 202 : return "cloud.bolt.rain.fill"
    case 210 : return "cloud.bolt.rain.fill"
    case 211 : return "cloud.bolt.rain.fill"
    case 212 : return "cloud.bolt.rain.fill"
    case 221 : return "cloud.bolt.rain.fill"
    case 230 : return "cloud.bolt.rain.fill"
    case 231 : return "cloud.bolt.rain.fill"
    case 232 : return "cloud.bolt.rain.fill"
        
        // Drizzle ID 3XX
    case 300: return "cloud.drizzle.fill"
    case 301 : return "cloud.drizzle.fill"
    case 302 : return "cloud.drizzle.fill"
    case 310 : return "cloud.drizzle.fill"
    case 311 : return "cloud.drizzle.fill"
    case 312 : return "cloud.drizzle.fill"
    case 313 : return "cloud.drizzle.fill"
    case 314 : return "cloud.drizzle.fill"
    case 321 : return "cloud.drizzle.fill"
        
        // Rain ID 5XX
    case 500: return "cloud.drizzle.fill"
    case 501 : return "cloud.rain.fill"
    case 502 : return "cloud.rain.fill"
    case 503 : return "cloud.rain.fill"
    case 504 : return "cloud.rain.fill"
    case 511 : return "cloud.sleet.fill"
    case 520 : return "cloud.rain.fill"
    case 521 : return "cloud.rain.fill"
    case 522 : return "cloud.rain.fill"
    case 532 : return "cloud.rain.fill"
        
        // Snow ID 6XX
    case 600: return "cloud.snow.fill"
    case 601 : return "cloud.snow.fill"
    case 602 : return "cloud.snow.fill"
    case 611 : return "cloud.snow.fill"
    case 612 : return "cloud.snow.fill"
    case 613 : return "cloud.snow.fill"
    case 615 : return "cloud.snow.fill"
    case 616 : return "cloud.snow.fill"
    case 620 : return "cloud.snow.fill"
    case 621 : return "cloud.snow.fill"
    case 622 : return "cloud.snow.fill"
        
        // Amosphere ID 7XX
    case 701: return "smoke.circle.fill"
    case 711 : return "smoke.circle.fill"
    case 721 : return "smoke.circle.fill"
    case 731 : return "smoke.circle.fill"
    case 741 : return "cloud.fog.fill"
    case 751 : return "smoke.circle.fill"
    case 761 : return "smoke.circle.fill"
    case 762 : return "smoke.circle.fill"
    case 771 : return "smoke.circle.fill"
    case 781 : return "tornado"
        
        // Clear ID 800
    case 800: return "sun.max.fill"
        
        // Clouds ID 8XX
    case 801: return "cloud.sun.fill"
    case 802 : return "cloud"
    case 803 : return "cloud.fill"
    case 804 : return "smoke.fill"
        
    default: return "questionmark.circle.fill";
    }
}
