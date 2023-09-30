//
//  MainWeatherView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit
import Kingfisher

class MainWeatherView: BaseView  {
    var MainData :String?
    var MainTF : Bool = false
    
    
    lazy var subTitle = SubTitleLabel(text: MainTF ? "현재 날씨" : "내일 날씨")
    var viewImg : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(systemName: "heart")
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .gray
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
        return view
    }()
    var nowTemp :UILabel = {
        let view = UILabel()
         view.text = "강수량 시간당 얼마"
        view.translatesAutoresizingMaskIntoConstraints = false
         return view
    }()
    
    override func configure() {
        DispatchQueue.main.async { [self] in

            if MainTF {
                let borderY :Int = 119
                var borderX :Int = 0
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                        let mainWindow = windowScene.windows.first {
                    borderX = Int(mainWindow.frame.size.width) - 32
                     }
                border.frame = CGRect(x: 0, y: borderY , width: borderX, height: 1)
                layer.addSublayer(border)
            }
        }
   
        
        addSubview(subTitle)
        addSubview(viewImg)
        addSubview(nowWeather)
        addSubview(nowTemp)
        
    }
    override func setConstraints() {
        subTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        viewImg.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(4)
            make.leading.equalTo(subTitle.snp.leading)
            make.size.equalTo(80)
        }
        nowWeather.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(4)
            make.leading.equalTo(viewImg.snp.trailing).offset(8)
            make.height.equalTo(38)
            make.trailing.equalToSuperview()
        }
        nowTemp.snp.makeConstraints { make in
            make.top.equalTo(nowWeather.snp.bottom).offset(4)
            make.leading.equalTo(viewImg.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.height.equalTo(38)
        }
    }
}
