//
//  weatherManager.swift
//  MyOotdMemory
//
//  Created by zeze kim on 10/7/23.
//

import Foundation
import Alamofire
import CoreLocation


class WeatherManager {
    
    static let shared = WeatherManager()
    private init() { }
    
    func callRequestToday(city:CLLocationCoordinate2D ,success: @escaping (WeatherData) -> Void, failure: @escaping () -> Void ) {
        let lat = city.latitude
        let lon = city.longitude
       let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=metric&appid=\(APIKey.weatherKey)"
        AF.request(url, method: .get).validate(statusCode: 200...500)
            .responseDecodable(of: WeatherData.self) { response in
                
                switch response.result {
                case .success(let value): success(value)
            
                case .failure(let error):
                    print(error)
                    failure() //호출만 하겠다 (밖에서 쓰겠다)
                }
            }
    }
    func callRequestTomorrow(city:CLLocationCoordinate2D ,success: @escaping (WeatherData) -> Void, failure: @escaping () -> Void ) {
        let lat = city.latitude
        let lon = -city.longitude
       let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&exclude=current,minutely,hourly&units=metric&appid=\(APIKey.weatherKey)&lang=kr"
        AF.request(url, method: .get).validate(statusCode: 200...500)
            .responseDecodable(of: WeatherData.self) { response in
                
                switch response.result {
                case .success(let value): success(value)
                    // 코더블 오류 뜨면 다시 다시해야함 이거 미루자
                case .failure(let error):
                    print(error)
                    failure() //호출만 하겠다 (밖에서 쓰겠다)
                }
            }
    }
}
//
//class Location {
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last {
//            let latitude = location.coordinate.latitude
//            let longitude = location.coordinate.longitude
//
//            // 위치 정보를 사용하여 원하는 작업을 수행할 수 있습니다.
//            print("현재 위치 - 위도: \(latitude), 경도: \(longitude)")
//        }
//    }
//}
