//
//  WeatherModel.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import Foundation
import RealmSwift

class WeatherSave :Object {
    
    @Persisted(primaryKey: true) var _id:ObjectId
    @Persisted var humidity :String
    @Persisted var temp : String
    @Persisted var date : Date
    @Persisted var icon : String
    @Persisted var main : String
    @Persisted var windSpeed : Double
    @Persisted var clouds : Int
    @Persisted var coord : String
    
    convenience init(humidity: String, temp: String, date: Date , icon: String ,main:String , windSpeed: Double ,clouds:Int, coord:String) {
        self.init()
        self.humidity = humidity
        self.temp = temp
        self.date = date
        self.icon = icon
        self.main = main
        self.temp = temp
        self.windSpeed = windSpeed
        self.clouds = clouds
        self.coord = coord
    }
    
}
