//
//  DateDiaryView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/01.
//

import UIKit
import SnapKit

class DateDiaryView: BaseView {
    

    
    let imgView : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        return view
    }()
    
    override func configure() {
      addSubview(imgView)
    }
    override func setConstraints() {
        imgView.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(600)
            make.top.leading.equalToSuperview()
        }
    }

}
