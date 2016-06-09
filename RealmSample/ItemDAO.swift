//
//  ItemDAO.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/08.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import RealmSwift

// クラス：Itemへのデータアクセス処理をまとめたクラス
// 継承：Object
class ItemDAO: Object {
    // 保存処理関数
    static func saveItem(itemDataArr: [Item]) -> Void {
        do {
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            let realm = try Realm()
            realm.beginWrite()
            for v in itemDataArr {
                realm.add(v, update: true)
            }
            try realm.commitWrite()
        } catch {
            print("保存処理に失敗")
        }
    }
    // 取得関数
    static func getItem(itemId: Int) -> Item? {
        do {
            let realm = try Realm()
            if let data = realm.objectForPrimaryKey(Item.self, key: itemId) {
                return data
            }
        } catch {
            print("取得処理に失敗")
        }
        return nil
    }
}
