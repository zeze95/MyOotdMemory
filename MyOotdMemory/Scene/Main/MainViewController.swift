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
        view.backgroundColor = .red
        return view
    }()
    let afterView : MainWeatherView = {
        let view = MainWeatherView(frame: .zero)
        view.MainTF = false
        return view
    }()
    
    override func configureView() {
        view.addSubview(scrollWrapperView)
        scrollWrapperView.addSubview(nowView)
        scrollWrapperView.addSubview(adviceView)
        scrollWrapperView.addSubview(afterView)
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
            make.bottom.equalTo(afterView.snp.top)
        }
        afterView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(110)
        }
    }
    



}
