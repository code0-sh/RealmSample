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
                    ItemDAO.saveItem(itemDataArr)
                }
            }
        }
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
            if let data = realm.objectForPrimaryKey(Item.self, key: 24853) {
                print("itemId:24853 \(data.name)")
            }
        } catch {
            print("検索に失敗しました。")
        }
    }
}
