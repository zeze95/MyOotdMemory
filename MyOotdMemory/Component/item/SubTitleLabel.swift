//
//  SubTitleLabel.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/03.
//

import UIKit

class SubTitleLabel :UIView  {
    
    private let label: UILabel

     init(text: String) {
         label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 17)
         label.text = text
         label.textColor = Constants.BaseColor.text
         super.init(frame: .zero)
         addSubview(label)
     }

     override func layoutSubviews() {
         super.layoutSubviews()
         label.frame = bounds
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }
