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
        static let backgroundBlack = UIColor(red: 40.0 / 255.0, green: 40.0  / 255.0, blue: 50.0 / 255.0, alpha: 1.0)
        static let backgroundGray = UIColor(red: 243.0 / 255.0, green: 243.0  / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
        static let background = UIColor.white
        static let border = CGColor(red:145.0 / 255.0, green: 150.0  / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        static let borderbackground = UIColor(red:185.0 / 255.0, green: 185.0  / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        static let text = UIColor.black
        static let placeholder = UIColor.gray
        static let point = UIColor(red: 95.0 / 255.0, green: 90.0  / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
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
