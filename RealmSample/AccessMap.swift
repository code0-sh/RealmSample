//
//  AccessMap.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/08.
//  Copyright © 2016年 omura.522. All rights reserved.
//
import Foundation
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

class AccessMap: Object, Mappable {
    dynamic var isUpdate = false
    dynamic var recordCount = 0
    var accessMapRecords = List<AccessMapRecord>()
    dynamic var error: String?
    required convenience init?(_ map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        isUpdate <- map["IsUpdate"]
        recordCount <- map["RecordCount"]
        accessMapRecords <- map["Records"]
        error <- map["Error"]
    }
}
