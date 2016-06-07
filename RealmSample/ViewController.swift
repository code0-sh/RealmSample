//
//  ViewController.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/06.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.addTarget(self,
                      action: #selector(ViewController.btnPressed(_:)),
                      forControlEvents: .TouchUpInside)
        let jsonUrl = "http://fkcorporation.co.jp/files/sample_10k.json"
        Alamofire.request(.GET, jsonUrl).responseJSON { response in
            if response.result.isSuccess {
                if let itemDataArr: [Item] = Mapper<Item>().mapArray(response.result.value) {
                    do {
                        let realm = try Realm()
                        realm.beginWrite()
                        realm.deleteAll()
                        for v in itemDataArr {
                            realm.add(v)
                        }
                        try realm.commitWrite()
                    } catch {
                        // Error handling
                    }
                }
            }
        }
//        do {
//// 登録
////            let realm = try Realm(
////                configuration: Realm.Configuration(inMemoryIdentifier: "TemporaryRealm")
////            )
//            let realm = try Realm()
//            print(Realm.Configuration.defaultConfiguration.fileURL!)
//            let car1 = Car(value: ["brand": "BMW", "year": 1980])
//            let car2 = Car()
//            car2.brand = "DeLorean"
//            car2.name = "Outatime"
//            car2.year = 1981
//            // people
//            let wife = Person()
//            wife.name = "Jennifer"
//            wife.cars.appendContentsOf([car1, car2])
//            wife.age = 47
//            let husband = Person(value: [
//                "name": "Marty",
//                "age": 47,
//                "spouse": wife
//                ])
//            wife.spouse = husband
//            try realm.write {
//                realm.add(husband)
//            }
//        } catch let error as NSError {
//            // Error handling
//            print(error)
//        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func btnPressed(sender: AnyObject?) {
        do {
            let realm = try Realm()
            let records: Results = realm.objects(Item)
                                        .filter("itemCode BEGINSWITH '0'").sorted("itemCode")
            for v in records {
                print(v)
            }
        } catch {
            // Error handling
        }
    }
}
