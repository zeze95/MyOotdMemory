//
//  WeatherRepositoryTomorrow.swift
//  MyOotdMemory
//
//  Created by 겜팜스토어 on 10/9/23.
//

import Foundation
import RealmSwift

class WeatherRepositoryTomorrow {
    
   let realm = try! Realm()
    
    func checkSchemaVersion(){
        do{
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("schema Version:\(version) ")
            print("위치:",realm.configuration.fileURL!)
        }catch{
            print(error)
        }
    }
    
//    func fetchFilterDate(date: String) -> Bool {
//         let existingItem = realm.objects(WeatherSaveTomorrow.self).filter("date == %@", date)
//         if existingItem.isEmpty {
//             return true
//         } else {
//             return false
//         }
//     }
     
    
    func fetch() -> Results<WeatherSaveTomorrow>{
        let data = realm.objects(WeatherSaveTomorrow.self)
        return data
     }
                                    
    func createItem(data: WeatherSaveTomorrow) {
      try! realm.write {
        realm.add(data , update: .modified)
            }
        }
    
//    func deleteItem(date: String){
//        let itemsDelete = realm.objects(WeatherSaveTomorrow.self).filter("date != %@", date)
//        
//        try! realm.write {
//            realm.delete(itemsDelete)
//        }
//    }
  


}
