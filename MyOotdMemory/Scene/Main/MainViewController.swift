//
//  MainViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController {
        
    var scrollWrapperView : UIScrollView = {
        let view = UIScrollView()

        return view
    }()
    let nowView : MainWeatherView = {
        let view = MainWeatherView(frame: .zero)
        view.MainTF = true
        return view
    }()
    
    let adviceView : MainAdviceView = {
        let view = MainAdviceView(frame: .zero)
        return view
        // 밑에 줄 넣어서 구분할지 말지 나중에 정하기
    }()
    let afterView : MainWeatherView = {
        let view = MainWeatherView(frame: .zero)
        view.MainTF = false
        return view
    }()
    
    override func configureView() {
        view.addSubview(scrollWrapperView)
        scrollWrapperView.addSubview(nowView)
     
        scrollWrapperView.addSubview(afterView)
        scrollWrapperView.addSubview(adviceView)
    }
    
    override func setConstraints() {
        scrollWrapperView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        nowView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(110)
        
        }
        adviceView.snp.makeConstraints { make in
            make.top.equalTo(nowView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(250)
        }
        afterView.snp.makeConstraints { make in
            make.top.equalTo(adviceView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(scrollWrapperView.snp.bottom)
            make.height.equalTo(110)
        }
    }
    



}
