//
//  WeatherTable.swift
//  MyOotdMemory
//
//  Created by 겜팜스토어 on 10/7/23.
//

import Foundation


import Foundation
import RealmSwift

class WeatherSave :Object {
    
    @Persisted(primaryKey: true) var _id:ObjectId
    @Persisted var humidity :String // 습도
    @Persisted var temp : String //let temp = json["main"]["temp"].doubleValue - 273.15
    @Persisted var date : Date
    @Persisted var descrip : String
    @Persisted var rain : String?
    @Persisted var snow : String?
    @Persisted var clouds : Int // 흐림 퍼센트
    @Persisted var coord : String
    
    convenience init(humidity: String, temp: Double, date: Date ,descrip:String ,clouds:Int, coord:String) {
        self.init()
        self.humidity = humidity
        self.temp = String(temp - 273.15)
        self.descrip = descrip
        self.clouds = clouds
        self.coord = coord
    }
    
}
