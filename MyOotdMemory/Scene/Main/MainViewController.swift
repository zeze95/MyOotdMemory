//
//  MainViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit
import SnapKit
import CoreLocation

class MainViewController: BaseViewController {
    var locationManager = CLLocationManager()
    var weatherData : WeatherData?
    let repository = WeatherSaveRepository()
    let repositoryTomorrow = WeatherRepositoryTomorrow()
    var contry :String = "seoul"
    var contrySwaper = contrySwap()
    let icons = WeatherIconSwap()
    
    
    var scrollWrapperView : UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    lazy var nowView : MainWeatherView = {
        let view = MainWeatherView(frame: .zero)
        return view
    }()
    
    let adviceView : MainAdviceView = {
        let view = MainAdviceView(frame: .zero)
        return view
        // 밑에 줄 넣어서 구분할지 말지 나중에 정하기
    }()
    
    override func configureView() {
        view.addSubview(scrollWrapperView)
        scrollWrapperView.addSubview(nowView)
        scrollWrapperView.addSubview(adviceView)
        locationManager.delegate = self
        checkDeviceLocationAuthrization()
    }
    
    override func setConstraints() {
        scrollWrapperView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        nowView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(140)
        
        }
        adviceView.snp.makeConstraints { make in
            make.top.equalTo(nowView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(265)
        }
    }
    

    func checkDeviceLocationAuthrization() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                // 위치 권한 상태 확인
                let authorization: CLAuthorizationStatus = self.locationManager.authorizationStatus
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청 불가")
            }
            
        }
    }
        func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {

            switch status {
            case .notDetermined: // 선택하지 않은경우
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.requestWhenInUseAuthorization()
            case .restricted: print("restricted") // 서비스를 사용할 권한 없음 자녀보호기능
            case .denied: //사용거부 경우
                showLocationSettingAlert()
//                let sesacCenter = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270) // 새싹 영등포 캠퍼스
    
            case .authorizedAlways: // 항상 승인한경우
                print("authorizedAlways")
                locationManager.startUpdatingLocation()
            case .authorizedWhenInUse: // 사용중인동안 승인
                print("authorizedWhenInUse")
                locationManager.startUpdatingLocation()
            case .authorized:
                print("authorized")
                locationManager.startUpdatingLocation()
            @unknown default: print("default")
            }
            
        }
        func showLocationSettingAlert() {
            let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
            let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
                
                if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSetting)
                }
            }
            
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            
            alert.addAction(goSetting)
            alert.addAction(cancel)
            
            present(alert, animated: true)
        }

    }
        
        


    



extension MainViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // 새로운 위치가 생기면 알려줌
        print(#function)
        if let coordinate = locations.last?.coordinate { // 위도 경도 값 가져오기
            let geocoder = CLGeocoder()
            let geo = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            geocoder.reverseGeocodeLocation(geo) { (placemarks, error) in
                if let placemark = placemarks?.first {
                    if let city = placemark.locality {
                        self.contry = city
                    }
                }
            }
            repository.checkSchemaVersion()
            if repository.fetch().isEmpty {
                
            }
            let dateCheck = DateFormatter.dateCheck(from: Date())
            if dateCheck {
                DispatchQueue.main.async {
                    var scription: String = ""
                    WeatherManager.shared.callRequestToday(city: coordinate) { [self] data in
                        weatherData = data
                        print(data)
                        if let firstWeatherElement = data.weather.first {
                            let weatherDescription = firstWeatherElement.description
                            scription = weatherDescription
                        }
                        let saveData = WeatherSave(humidity: String(data.main.humidity), temp: Int(data.main.temp), date: Date(), descrip: scription, clouds: data.clouds.all, coord: data.name)
                        repository.createItem(data: saveData)
                        let contryName = contrySwaper.contrySwap(contry:data.name)
                        let cityName = contrySwaper.swap(contry:data.name)
                        
                        nowView.contryLabel.text = "\(contryName)"
                        nowView.nowWeather.text = "오늘 날씨 \(scription)"
                        nowView.nowTemp.text = "온도 \(Int(data.main.temp))°C 습도 \(String(data.main.humidity))%"
                        let icon = icons.WeatherIcon(weather: scription)
                        nowView.imgView.image = UIImage(named: icon)
                    } failure: {
                        print("오류")
                    }
                   
                }
            }else {
                print("이미 오늘 날씨 있어")
            }
            
        }
        
        locationManager.stopUpdatingLocation() // 한번만 실행하고 싶을 때
    }
    
    


// 위치 업데이트 실패 시 호출
func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("= 사용자 위치 가져오기 실패=", error)
}
// 위치 권한 상태 변경 시 호출
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        locationManager.startUpdatingLocation()
        
    }
}
