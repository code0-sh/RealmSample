//
//  ViewController.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/06.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            // 登録
//            let realm = try Realm(
//                configuration: Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")
//            )
            let realm = try Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            let car1 = Car(value: ["brand": "BMW", "year": 1980])
            let car2 = Car()
            car2.brand = "DeLorean"
            car2.name = "Outatime"
            car2.year = 1981
            // people
            let wife = Person()
            wife.name = "Jennifer"
            wife.cars.appendContentsOf([car1, car2])
            wife.age = 47
            let husband = Person(value: [
                "name": "Marty",
                "age": 47,
                "spouse": wife
                ])
            wife.spouse = husband
            
            try realm.write {
                realm.add(husband)
            }
            
        } catch let error as NSError {
            // Error handling
            print(error)
        }



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
