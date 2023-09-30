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

    var calenderView :UIView = {
        let view = UIView()
        view.backgroundColor = .black
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
    }
  
    
    override func setConstraints() {
        calenderView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(330)
        }
        dateCollectionView.snp.makeConstraints { make in
            make.top.equalTo(calenderView.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(4)
        }
    }

}
