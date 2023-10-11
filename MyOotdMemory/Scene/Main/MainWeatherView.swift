//
//  MainWeatherView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit
import Kingfisher
import RealmSwift

class MainWeatherView: BaseView  {
    var MainData :WeatherSave?
    var MainDataTomorrow :WeatherSaveTomorrow?
    let icons = WeatherIconSwap()
    let repository = WeatherSaveRepository()
    let tomorrowRepo = WeatherRepositoryTomorrow()
    lazy var subTitle = SubTitleLabel(text: "현재 날씨")
    var contryLabel :UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.BaseColor.text
        view.font = UIFont(name: "SUITE-SemiBold", size: 13)
        view.textAlignment = .right
        return view
    }()
    var viewImg : UIView = {
       let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = Constants.BaseColor.border
        view.layer.cornerRadius = 25
        view.backgroundColor = Constants.BaseColor.borderbackground
        view.clipsToBounds = true
        return view
    }()
    var imgView :UIImageView = {
        let view = UIImageView()
         view.image = UIImage(systemName: "heart")
         view.contentMode = .scaleAspectFill
        
         return view
    }()
    var border: CALayer = {
        let view = CALayer()
        view.backgroundColor = UIColor.lightGray.cgColor
        view.borderWidth = 2
        return view
    }()
    var nowWeather : UILabel = {
       let view = UILabel()
        view.text = "비내리는 날"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = Constants.BaseColor.text
        view.font = UIFont(name: "SUITE-Light", size: 17)
        return view
    }()
    var nowTemp :UILabel = {
        let view = UILabel()
         view.text = "강수량 시간당 얼마"
        view.textColor = Constants.BaseColor.text
        view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()


    override func configure() {

        
        DispatchQueue.main.async { [self] in
            let borderY :Int = 139
            var borderX :Int = 0
            border.borderColor = UIColor.lightGray.cgColor
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                    let mainWindow = windowScene.windows.first {
                borderX = Int(mainWindow.frame.size.width) - 32
                 }
            border.frame = CGRect(x: 0, y: borderY , width: borderX, height: 1)
            layer.addSublayer(border)
            dataSetting()
          
        }
   
        
        addSubview(subTitle)
        addSubview(contryLabel)
        addSubview(viewImg)
        viewImg.addSubview(imgView)
        addSubview(nowWeather)
        addSubview(nowTemp)

    }

    func dataSetting() {
        let dataList = repository.fetch()
        if dataList.count != 0 {
            MainData = dataList[dataList.count-1]
            guard let nowData = MainData else {return}
            contryLabel.text = "\(nowData.coord) "
            nowWeather.text = "오늘날씨 \(nowData.descrip)"
            nowTemp.text = "온도 \(nowData.temp)°C 습도\(nowData.humidity)%"
            let icon = icons.WeatherIcon(weather: nowData.descrip)
            imgView.image = UIImage(named: icon)
            
        }
        subTitle.label.text = "오늘 날씨"
    }
    
    override func setConstraints() {
        subTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview()
            make.height.equalTo(18)
            make.width.equalTo(180)
        }
        contryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalTo(subTitle.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        viewImg.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(14)
            make.leading.equalTo(subTitle.snp.leading)
            make.size.equalTo(80)
        }
        imgView.snp.makeConstraints { make in
            make.top.equalTo(viewImg.snp.top).offset(15)
            make.leading.equalTo(viewImg.snp.leading).offset(15)
            make.size.equalTo(50)
        }
        nowWeather.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(14)
            make.leading.equalTo(viewImg.snp.trailing).offset(15)
            make.height.equalTo(30)
            make.trailing.equalToSuperview()
        }
        nowTemp.snp.makeConstraints { make in
            make.top.equalTo(nowWeather.snp.bottom).offset(4)
            make.leading.equalTo(viewImg.snp.trailing).offset(15)
            make.trailing.equalToSuperview()
            
            make.height.equalTo(30)
        }
    }
}
