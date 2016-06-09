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

class AccessMapOuter: Mappable {
    var accessMap: AccessMap?
    required init?(_ map: Map) {}
    func mapping(map: Map) {
        accessMap <- map["AccessMap"]
    }
}

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

class AccessMapRecord: Object, Mappable {
    dynamic var exhibitionContentsId = 0
    dynamic var language = 0
    dynamic var destinationName = ""
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
    dynamic var secondDestinationName = ""
    dynamic var secondLatitude = 0.0
    dynamic var secondLongitude = 0.0
    dynamic var isActive = false
    required convenience init?(_ map: Map) {
        self.init()
    }
    func mapping(map: Map) {
        exhibitionContentsId <- map["ExhibitionContentsId"]
        language <- map["Language"]
        destinationName <- map["DestinationName"]
        latitude <- map["Latitude"]
        longitude <- map["Longitude"]
        secondDestinationName <- map["SecondDestinationName"]
        secondLatitude <- map["SecondLatitude"]
        secondLongitude <- map["SecondLongitude"]
        isActive <- map["IsActive"]
    }
    override static func primaryKey() -> String? {
        return "exhibitionContentsId"
    }
}
