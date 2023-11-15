//
//  ContentView.swift
//  weather
//
//  Created by mik on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDark = false
    
    
    var body: some View {
        
        ZStack{
            BackgroundView(isDark: $isDark)
            
            VStack {
                CityNameView(cityName: "Bangalore, IN")
                
                Spacer()
                
                MainWeatherView(imageName:"cloud.rain.fill", temp: 25)
                
                HStack() {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temp: 28)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.rain.fill", temp: 25)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.heavyrain.fill", temp: 23)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.rain.fill", temp: 22)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.bolt.rain.fill", temp: 20)
                }
                
                Spacer()
                
                Button {
                    isDark.toggle()
                } label: {
                    ButtonView(
                        title: isDark ? "light mode" : "dark mode",
                        textColor: isDark ? .white : .white,
                        backgroundColor: isDark ? .black : .blue)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°C")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
        }.padding(12)
    }
}

struct BackgroundView: View {
    
    @Binding var isDark: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [isDark ? .black : .blue, isDark ? .gray : .teal]),
                startPoint: .topLeading,
                endPoint: .bottomLeading
        )
    }
}

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium)).foregroundColor(.white).padding()
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .symbolEffect(.pulse, isActive: false)
            .frame(width: 180, height:180)
        
        
        Text("\(temp)°C").font(.system(size: 70, weight: .medium)).foregroundColor(.white)
            .padding(20)
    }
}


