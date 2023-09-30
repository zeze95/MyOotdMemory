//
//  DateDiaryCollectionViewCell.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/02.
//

import UIKit
import SnapKit
class DateDiaryCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = UIImageView()
        return view
    }()
      
    override func configure() {
        contentView.addSubview(imageView)
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}

//class DateDiaryCollectionViewCell: BaseCollectionViewCell {
//    
//    let BackView = {
//        let view = UIView()
//        view.backgroundColor = .purple
//        return view
//    }()
//    
//    let diaryImgView = {
//        let view = UIImageView()
//        view.backgroundColor = .gray
//        return view
//    }()
//    
//    
//    let diaryTempLabel = {
//        let view = UILabel()
//        view.numberOfLines = 0
//        view.backgroundColor = .blue
//        view.text = "여기는 테스트 온도 "
//        view.textColor = .black
//        return view
//    } ()
//    
//    override func configure() {
//        backgroundColor = .green
//        tintColor = .blue
//        addSubview(BackView)
//        BackView.addSubview(diaryImgView)
//        BackView.addSubview(diaryTempLabel)
//    }
//    
//    override func setConstraints() {
//        BackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        diaryImgView.snp.makeConstraints { make in
//            make.top.leading.trailing.bottom.equalTo(contentView)
//            }
//        diaryTempLabel.snp.makeConstraints { make in
//            make.top.equalTo(contentView).offset(8)
//            make.leading.equalTo(diaryImgView.snp.trailing).offset(8)
//        }
//    }
//    
//    
//    
//}
//
//
