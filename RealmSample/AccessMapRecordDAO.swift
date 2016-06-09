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
    static func saveAccessMapRecord(accessMapRecords: [AccessMapRecord]) -> Void {
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
}
