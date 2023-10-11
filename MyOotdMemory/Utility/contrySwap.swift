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
    case "seoul" : return "서울"
    case "busan" : return "부산"
    case "daegu" : return "대구"
    case "incheon" : return "인천"
    case "gwangju" : return "광주"
    case "daejeon" : return "대전"
    case "ulsan" : return "울산"
    case "suwon" : return "수원"
    case "cheongju" : return "청주"
    case "jeju" : return "제주"
    default:
        return contry
    }
    }
    func contrySwap(contry:String)-> String {
    switch contry.lowercased() {
    case "kr" : return "서울"
    case "cn" : return "중국"
    case "jp" : return "일본"
    default:
        return contry
    }
    }
}
