//
//  WeatherRepository.swift
//  MyOotdMemory
//
//  Created by 겜팜스토어 on 10/7/23.
//

import Foundation
import RealmSwift

class WeatherSaveRepository {
    
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
    
    func fetchFilterDate(date: Date) -> Bool {
         let existingItem = realm.objects(WeatherSave.self).filter("date == %@", date)
         if existingItem.isEmpty {
             return true
         } else {
             return false
         }
     }

    
    func fetch() -> Results<WeatherSave>{
        let data = realm.objects(WeatherSave.self)
        return data
     }
                                    
    func createItem(data: WeatherSave) {
      try! realm.write {
        realm.add(data , update: .modified)
            }
        }
    
    func deleteItem(date: Date){
        let itemsDelete = realm.objects(WeatherSave.self).filter("date != %@", date)
        
        try! realm.write {
            realm.delete(itemsDelete)
        }
    }
  


}
