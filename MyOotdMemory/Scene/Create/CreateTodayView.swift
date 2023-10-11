//
//  CreateTodayView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/03.
//
import UIKit

class CreateTodayView : BaseView {
    let icons = WeatherIconSwap()
    let repository = WeatherSaveRepository()
    var weatherData :WeatherSave?
    
    var viewImg : UIView = {
       let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = Constants.BaseColor.border
        view.layer.cornerRadius = 20
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
    var nowWeather : UILabel = {
       let view = UILabel()
        view.text = "비내리는 날"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "SUITE-Regular", size: 17)
        view.textColor = Constants.BaseColor.text
        return view
    }()
    
    
    override func configure() {
        addSubview(viewImg)
        addSubview(nowWeather)
        viewImg.addSubview(imgView)
        
        dataSetting()
    }
    
    func dataSetting() {
        let dataList = repository.fetch()
        if dataList.count != 0 {
            weatherData = dataList[dataList.count-1]
            guard let nowData = weatherData else {return}
            nowWeather.text = "오늘 날씨 : \(nowData.descrip) \(nowData.temp)도"
            let icon = icons.WeatherIcon(weather: nowData.descrip)
            imgView.image = UIImage(named: icon)
        }
    }
    override func setConstraints() {
        viewImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(15)
            make.size.equalTo(40)
        }
        imgView.snp.makeConstraints { make in
            make.top.equalTo(viewImg.snp.top).offset(5)
            make.leading.equalTo(viewImg.snp.leading).offset(5)
            make.size.equalTo(30)
        }
        nowWeather.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalTo(viewImg.snp.trailing).offset(8)
            make.height.equalTo(30)
            make.trailing.equalToSuperview()
            
        }
    }
}



