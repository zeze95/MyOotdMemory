//
//  DateViewController.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import UIKit
import SnapKit
import FSCalendar

class DateViewController: BaseViewController {
    var selectedDate: Date = Date()
    var calenderView :UIView = {
        let view = UIView()
        return view
    }()
    var myCalender = {
        let view = FSCalendar()
        view.backgroundColor = .white
        return view
    }()
    
//    lazy var dateViewCollectionView = {
//        let view = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
//        view.register(DateDiaryCollectionViewCell.self, forCellWithReuseIdentifier: "DateDiaryCollectionViewCell")
//        view.delegate = self
//        view.dataSource = self
//        view.collectionViewLayout = collectionViewLayout()
//        return view
//    }()
   
    let dateCollectionView :DateDiaryCollectionView = {
        let view = DateDiaryCollectionView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    override func configureView() {
        view.addSubview(calenderView)
        view.addSubview(dateCollectionView)
        calenderView.addSubview(myCalender)
        myCalender.delegate = self
        myCalender.dataSource = self
        setCalendarUI()
    }
  
    
    override func setConstraints() {
        calenderView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(330)
        }
        myCalender.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        dateCollectionView.snp.makeConstraints { make in
            make.top.equalTo(calenderView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(4)
        }
    }

}

extension DateViewController :  FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    func setCalendarUI() {
        
        // calendar locale > 한국으로 설정
        myCalender.locale = Locale(identifier: "ko_KR")
        
        // 상단 요일을 한글로 변경
        myCalender.calendarWeekdayView.weekdayLabels[0].text = "일"
        myCalender.calendarWeekdayView.weekdayLabels[1].text = "월"
        myCalender.calendarWeekdayView.weekdayLabels[2].text = "화"
        myCalender.calendarWeekdayView.weekdayLabels[3].text = "수"
        myCalender.calendarWeekdayView.weekdayLabels[4].text = "목"
        myCalender.calendarWeekdayView.weekdayLabels[5].text = "금"
        myCalender.calendarWeekdayView.weekdayLabels[6].text = "토"
        
        // 월~일 글자 폰트 및 사이즈 지정
        myCalender.appearance.weekdayFont =  UIFont(name: "SUITE-Regular", size: 14)
        // 숫자들 글자 폰트 및 사이즈 지정
        myCalender.appearance.titleFont =  UIFont(name: "SUITE-Regular", size: 16)
        
        // 캘린더 스크롤 가능하게 지정
        myCalender.scrollEnabled = true
        // 캘린더 스크롤 방향 지정
        myCalender.scrollDirection = .vertical
        
        // Header dateFormat, 년도, 월 폰트(사이즈)와 색, 가운데 정렬
        myCalender.appearance.headerDateFormat = "YYYY년 MM월"
        myCalender.appearance.headerTitleFont = UIFont(name: "SUITE-Regular", size: 20)
        myCalender.appearance.headerTitleColor = Constants.BaseColor.text
        myCalender.appearance.headerTitleAlignment = .center
        
        // 요일 글자 색
        myCalender.appearance.weekdayTextColor = Constants.BaseColor.text
        //UIColor(named: "F5F5F5")?.withAlphaComponent(0.2)
        // 캘린더 높이 지정
        myCalender.headerHeight = 38
        // 캘린더의 cornerRadius 지정
        myCalender.layer.cornerRadius = 10
        myCalender.layer.borderColor = Constants.BaseColor.border
        myCalender.layer.borderWidth = 2
        myCalender.layer.masksToBounds = true
        
        // 양옆 년도, 월 지우기
        myCalender.appearance.headerMinimumDissolvedAlpha = 0.0
        
        // 달에 유효하지 않은 날짜의 색 지정
        myCalender.appearance.titlePlaceholderColor = UIColor.lightGray
        // 평일 날짜 색
        myCalender.appearance.titleDefaultColor = UIColor.black
        // 달에 유효하지않은 날짜 지우기
        myCalender.placeholderType = .none
        
        // 캘린더 숫자와 subtitle간의 간격 조정
        myCalender.appearance.subtitleOffset = CGPoint(x: 0, y: 10)
        
        myCalender.select(selectedDate)
    }
    // 원하는 날짜 아래에 subtitle 지정
    //    오늘 날짜에 오늘이라는 글자를 추가해보았다
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        if dateFormatter.string(from: Date()) == dateFormatter.string(from: date){
//            return "오늘"
//        }
//        return ""
//    }
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> UIImageView? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let ImgView :UIImageView = {
//            let view = UIImageView()
//            return view
//        }()
//        if dateFormatter.string(from: Date()) == dateFormatter.string(from: date){
//            return ImgView.imsadaskl;dkasdage
//        }
//        return ""
//    }
}
