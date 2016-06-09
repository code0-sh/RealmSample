//
//  AccessMapOuter.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/09.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import ObjectMapper

class AccessMapOuter: Mappable {
    var accessMap: AccessMap?

    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        accessMap <- map["AccessMap"]
    }
}
