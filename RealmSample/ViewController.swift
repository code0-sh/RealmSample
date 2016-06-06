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
        //Realmオブジェクト作成
        do {
            let realm = try Realm()
            print(Realm.Configuration.defaultConfiguration.fileURL!)
            let tanaka = User()
            tanaka.userId = 1
            tanaka.userName = "田中"
            tanaka.createdAt = NSDate().timeIntervalSince1970
            try realm.write {
                realm.add(tanaka)
            }
            
            let jim = Person()
            let rex = Dog()
            rex.owner = jim
            let someDogs = realm.objects(Dog).filter("name contains 'Fido'")
            jim.dogs.appendContentsOf(someDogs)
            jim.dogs.append(rex)
            
            
        } catch {
            // Error handling
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
