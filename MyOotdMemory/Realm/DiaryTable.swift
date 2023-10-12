//
//  DiaryTable.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import Foundation
import RealmSwift

class DiaryTable :Object {
    
    @Persisted(primaryKey: true) var _id:ObjectId // 구분하기 위한 역할
//    @Persisted var humidity :String // 습도
    @Persisted var date : String //
    @Persisted var temp : String // 온도
    @Persisted var weather : String // 날씨
    @Persisted var feel : String // 체감
    @Persisted var summary : String? // 20자 이내의 글
    @Persisted var photo: String? //일기 사진 URL
 
    convenience init(date: String, temp: String,weather: String ,feel:String , summary: String? ,photo: String?) {
        self.init()
//        self.humidity = humidity
        self.date = date
        self.temp = temp
        self.weather = weather
        self.feel = feel
        self.summary = summary
        self.photo = photo

    }
    
}

