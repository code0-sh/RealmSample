//
//  AccessMapRecordDAO.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/08.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import RealmSwift

class AccessMapRecordDAO: Object {
    // 保存処理関数
    static func saveAccessMapRecord(accessMapRecords: [AccessMapRecord]) {
        do {
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            let realm = try Realm()
            realm.beginWrite()
            for v in accessMapRecords {
                realm.add(v, update: true)
            }
            try realm.commitWrite()
        } catch {
            print("保存処理に失敗")
        }
    }
    // 取得関数
    static func getItem(itemId: Int) -> AccessMapRecord? {
        do {
            let realm = try Realm()
            let record = realm.objects(AccessMapRecord)
                                        .filter("isActive == true")
                                        .filter("exhibitionContentsId == \(itemId)")
                                        .first
            if let data = record {
                return data
            }
        } catch {
            print("取得処理に失敗")
        }
        return nil
    }
}
