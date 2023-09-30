//
//  MainAdviceCollectionViewCell.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/10/01.
//

import UIKit

class MainAdviceCollectionViewCell: BaseCollectionViewCell {
    
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
