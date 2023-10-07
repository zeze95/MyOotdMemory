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
        
        do {
            try realm.write {
                realm.add(item)
                print("Realm Add Succeed")
            }
        } catch {
            print(error)
        }
    }
    
    //Reaml Update
    func updateItem(id: ObjectId,feel:String ,photo: String, summary: String) {
        do {
            try realm.write {
                realm.create(DiaryTable.self, value: ["_id": id, "feel": feel ,"photo": photo, "summary": summary], update: .modified) //특정 테이블 값 변경
            }
        } catch {
            print("")
        }
        
    }
    func deleteItem(id:ObjectId){
        let itemsDelete = realm.objects(WeatherSave.self).filter("_id == %@", id)
        //  객체 삭제
        try! realm.write {
            realm.delete(itemsDelete)
        }
    }
    
}
