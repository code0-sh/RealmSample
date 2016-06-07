//
//  Person.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/07.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import RealmSwift

class Person: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var age = 0
    dynamic var spouse: Person?
    let cars = List<Car>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
