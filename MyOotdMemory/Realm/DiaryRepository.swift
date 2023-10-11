//
//  DiaryRepository.swift
//  MyOotdMemory
//
//  Created by zeze kim on 2023/09/30.
//

import Foundation
import RealmSwift

protocol DiaryTableRepositoryType: AnyObject { // AnyObject가 있는 곳에서만
    func fetch() -> Results<DiaryTable>
    func fetchFilterTemp(temp: String) -> Results<DiaryTable>
    func createItem(_ item: DiaryTable)
}

class DiaryTableRepository: DiaryTableRepositoryType {
    private let realm = try! Realm()

    func checkSchemaVersion() {
        do {
            let version = try schemaVersionAtURL(realm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
    }
    
    // Read
    func fetch() -> Results<DiaryTable> {
        let data = realm.objects(DiaryTable.self).sorted(byKeyPath: "date", ascending: false) // 정렬해서 데이터를 가져옴
        // 내림차순 true
        return data
    }
    
    func fetchFilterTemp(temp: String) -> Results<DiaryTable> {
        let existingItem = realm.objects(DiaryTable.self).filter("temp == %@", temp)
        return existingItem
    }

    
    //Reaml Create
    func createItem(_ item: DiaryTable) {
        let realItem = DiaryTable(date: item.date, temp: item.temp, weather: item.weather, feel: item.feel, summary: item.summary, photo: "Add_\(item._id).jpeg")
        do {
            try realm.write {

                realm.add(realItem)
                print("Realm Add Succeed")
            }
        } catch {
            print(error)
        }
    }
    
    //Reaml Update
    func updateItem(id: ObjectId,feel:String ,photo: String?, summary: String) {
        do {
            try realm.write {
                realm.create(DiaryTable.self, value: ["_id": id, "feel": feel ,"photo": "Add_\(id).jpeg", "summary": summary], update: .modified) //특정 테이블 값 변경
            }
        } catch {
            print("")
        }
        
    }
    func fetchFilterDate(date:String) -> Bool {
           let existingItem = realm.objects(DiaryTable.self).filter("date == %@", date)
           if existingItem.isEmpty { // 빈값이면
               return  true
           } else {
               return false // 있으면
           }
       }
    func findTodayData(date:String)  -> Results<DiaryTable>{
           let existingItem = realm.objects(DiaryTable.self).filter("date == %@", date)
        return existingItem
       }
    func deleteItem(id:ObjectId){
        
        let itemsDelete = realm.objects(WeatherSave.self).filter("_id == %@", id)
        //  객체 삭제
        
        try! realm.write {
            realm.delete(itemsDelete)
        }
        removeImageFromDocument(fileName: "Add_\(id).jpeg")
    }
    func removeImageFromDocument(fileName: String) {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        //2. 저장할 경로 설정(세부 경로, 이미지를 저장되어 있는 위치)
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        
        do {
            try FileManager.default.removeItem(at: fileURL)
        } catch {
            print(error)
        }
        
    }
}
