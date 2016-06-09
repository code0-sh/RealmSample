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
        print(ItemDAO.getItem(24853)?.name)
    }
}
