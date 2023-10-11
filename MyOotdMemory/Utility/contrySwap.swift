//
//  contrySwap.swift
//  MyOotdMemory
//
//  Created by 겜팜스토어 on 10/9/23.
//

import Foundation

class contrySwap {
    func swap(contry:String)-> String{
        switch contry.lowercased() {
    case "seoul" : return "한양"
    case "busan" : return "가마뫼"
    case "daegu" : return "달구벌"
    case "incheon" : return "매소홀"
    case "gwangju" : return "빛고을"
    case "daejeon" : return "한밭"
    case "ulsan" : return "우시산국"
    case "suwon" : return "수원"
    case "cheongju" : return "주성"
    case "jeju" : return "탐라"
    default:
        return contry
    }
    }
}
