//
//  WeatherIconSwap.swift
//  MyOotdMemory
//
//  Created by 겜팜스토어 on 10/9/23.
//

import Foundation

class WeatherIconSwap {
    func WeatherIcon(weather:String) -> String {
        switch weather {
        case "맑음" : return "sun"
        case "흐림" : return "cloudy"
        case "튼구름" : return "cloudy"
        case "부서진 구름": return "cloudy"
        case "약간의 구름이 낀 하늘" : return "cloudy2"
        case "비" : return "rainy"
        case "실 비" : return "rainy"
        case "눈" : return "snowy"

        default:
            return "weather-news"
        }
    }
}

// 아이콘 iconixar 출처
