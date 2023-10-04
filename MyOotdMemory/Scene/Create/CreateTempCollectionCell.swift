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
        return view
    }()
    var buttonTitle :String = "더워"
    override func configure() {
        addSubview(backview)
        backview.addSubview(tempButton)
        
    }
    
    override func setConstraints() {
        backview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        tempButton.snp.makeConstraints { make in
            make.edges.equalTo(backview)
        }
    }
}
