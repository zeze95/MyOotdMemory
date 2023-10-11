//
//  tempSwap.swift
//  MyOotdMemory
//
//  Created by 겜팜스토어 on 10/10/23.
//

import Foundation

class tempSwap {
    func tempSwapper(temp:String) -> String{
        guard let tempInt = Float(temp) else {return "dd"}
        switch tempInt {
        case ...4: break
        case 5...8: return "58"
        case 9...11: return "58"
        case 12...16: return "58"
        case 17...19: return "58"
        case 20...22: return "58"
        case 23...27: return "58"
        case 28...40: return "58"
        default:
            return "temp"
        }
    return "temp"
    }
}
