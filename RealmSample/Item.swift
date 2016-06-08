//
//  Item.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/07.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Item: Object, Mappable {
    dynamic var itemId = 0
    dynamic var itemCode = ""
    dynamic var name = ""
    dynamic var lot = 1
    dynamic var price = 0
    dynamic var janCode = ""
    override static func primaryKey() -> String? {
        return "itemId"
    }
    required convenience init?(_ map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        itemId <- map["item_id"]
        itemCode <- map["itemcode"]
        name <- map["name"]
        price <- map["price"]
        lot <- map["lot"]
        janCode <- map["jancode"]
    }
}
