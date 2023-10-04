//
//  CreateTodayView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/03.
//
import UIKit

class CreateTodayView : BaseView {
    
    var viewImg : UIImageView = {
       let view = UIImageView()
        view.image = UIImage(systemName: "heart")
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .gray
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
        addSubview(viewImg)
        addSubview(nowWeather)
        addSubview(nowTemp)
    }
    override func setConstraints() {
        viewImg.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(15)
            make.size.equalTo(60)
        }
        nowWeather.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(viewImg.snp.trailing).offset(8)
            make.height.equalTo(28)
            make.trailing.equalToSuperview()
        }
        nowTemp.snp.makeConstraints { make in
            make.top.equalTo(nowWeather.snp.bottom).offset(4)
            make.leading.equalTo(viewImg.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.height.equalTo(28)
        }
    }
}
