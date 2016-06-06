//
//  User.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/06.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    dynamic var userId = 0
    dynamic var userName = ""
    dynamic var createdAt: Double = 0
}
