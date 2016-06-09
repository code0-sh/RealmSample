//
//  AccessMap.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/08.
//  Copyright © 2016年 omura.522. All rights reserved.
//
import Foundation
import ObjectMapper
import RealmSwift

class AccessMap: Mappable {
    var isUpdate: Bool?
    var recordCount: Int?
    var accessMapRecords: [AccessMapRecord]?
    var error: String?
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        isUpdate <- map["IsUpdate"]
        recordCount <- map["RecordCount"]
        accessMapRecords <- map["Records"]
        error <- map["Error"]
    }
}
