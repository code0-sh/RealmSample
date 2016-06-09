//
//  ViewController.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/06.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.addTarget(self,
                      action: #selector(ViewController.btnPressed(_:)),
                      forControlEvents: .TouchUpInside)
        let jsonUrl = "http://164.70.8.70:10011/api/AccessMap/1f940027dc324dc8997e4fed9a510d02/21"
        Alamofire.request(.GET, jsonUrl)
                 .responseObject { (response: Response<AccessMapOuter, NSError>) in
            let accessMapOuter = response.result.value
            if let accessMapRecords = accessMapOuter?.accessMap?.accessMapRecords {
                AccessMapRecordDAO.saveAccessMapRecord(accessMapRecords)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func btnPressed(sender: AnyObject?) {
        print(AccessMapRecordDAO.getItem(21)?.destinationName)
    }
}
