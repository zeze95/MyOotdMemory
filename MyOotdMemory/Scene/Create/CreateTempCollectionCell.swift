//
//  CreateTempCollectionCell.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/04.
//

import UIKit
import SnapKit

class CreateTempCollectionCell : BaseCollectionViewCell{
    let backview :UIView = {
        let view = UIView()
        return view
    }()
    let tempButton = {
        let view = UIButton()
        view.setTitle("더워", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.layer.borderWidth = 2
        view.layer.borderColor = Constants.BaseColor.border
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    var buttonTitle :String = "더워"
    override func configure() {
        addSubview(backview)
        backview.addSubview(tempButton)
        
    }
    
    override func setConstraints() {
        backview.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
         
        }
        tempButton.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(40)
        }
    }
}
