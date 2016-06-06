//
//  Dog.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/06.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    dynamic var name = ""
    dynamic var owner: Person?
}

class Person: Object {
    dynamic var name = ""
    dynamic var birthdate = NSDate(timeIntervalSince1970: 1)
    let dogs = List<Dog>()
}
