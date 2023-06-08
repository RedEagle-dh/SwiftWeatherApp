//
//  LoadingView.swift
//  WeatherApp
//
//  Created by David Hermann on 06.06.23.
//

import SwiftUI

struct LoadingView: View {
    
    @State var isNight : Bool
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

/*struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}*/
