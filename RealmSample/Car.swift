//
//  Car.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/07.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import RealmSwift

class Car: Object {
    dynamic var brand = ""
    dynamic var name: String?
    dynamic var year = 0
}
