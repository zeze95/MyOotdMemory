//
//  ConstantsColor.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/23.
//

import UIKit

enum Constants {
 
    enum BaseColor {
       static let backgroundColor = UIColor(red: 250.0 / 255.0, green: 240.0  / 255.0, blue: 200.0 / 255.0, alpha: 1.0)
        static let backgroundColorAlpha = UIColor(red: 250.0 / 255.0, green: 200.0  / 255.0, blue: 140.0 / 255.0, alpha: 0.5)
        static let background = UIColor.white
        static let border = UIColor.lightGray.cgColor
        static let text = UIColor.black
        static let placeholder = UIColor.gray
        static let point = UIColor.systemRed
    }
    enum DarkColor {
        static let backgroundColor = UIColor(red: 40.0 / 255.0, green: 30.0  / 255.0, blue: 15.0 / 255.0, alpha: 1.0)
        static let background = UIColor.black
        static let border = UIColor.white.cgColor
        static let text = UIColor.white
        static let placeholder = UIColor.lightGray
        static let point = UIColor.systemRed
    }
    
}
