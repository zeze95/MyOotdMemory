//
//  BaseView.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/23.
//

import UIKit
import SnapKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        
    }
    
    func setConstraints() {}

}
