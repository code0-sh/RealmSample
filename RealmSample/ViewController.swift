//
//  ViewController.swift
//  RealmSample
//
//  Created by omura.522 on 2016/06/06.
//  Copyright © 2016年 omura.522. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.addTarget(self,
                      action: #selector(ViewController.btnPressed(_:)),
                      forControlEvents: .TouchUpInside)
        let jsonUrl = "http://164.70.8.70:10011/api/AccessMap/1f940027dc324dc8997e4fed9a510d02/21"
        Alamofire.request(.GET, jsonUrl).responseJSON { response in
            print(response)
            
//            if let accessMapRecords = response as! [String: AnyObject] {
//                AccessMapRecordDAO.saveAccessMapRecord(accessMapRecords)
//            }
            
//            if response.result.isSuccess {
//                if let accessMapRecords: List<AccessMapRecord> = Mapper<AccessMapRecord>()
//                                                                .mapArray(response.result.value) {
//                    AccessMapRecordDAO.saveAccessMapRecord(accessMapRecords)
//                }
//            }
        }
//        Alamofire.request(.GET, jsonUrl)
//                 .responseObject { (response: Response<AccessMap, NSError>) in
//            let accessMap = response.result.value
//            print(accessMap?.recordCount)
//            if let accessMapRecords = accessMap?.accessMapRecords {
//                AccessMapRecordDAO.saveAccessMapRecord(accessMapRecords)
//            }
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func btnPressed(sender: AnyObject?) {
        do {
            let realm = try Realm()
            let records: Results = realm.objects(AccessMapRecord)
                                        //.filter("language == 0")
                                        //.filter("isActive == true")
                                        .sorted("exhibitionContentsId")
            for v in records {
                print(v)
            }
            if let data = realm.objectForPrimaryKey(AccessMapRecord.self, key: 21) {
                print("exhibitionContentsId:21 \(data.destinationName)")
            }
        } catch {
            print("検索に失敗しました。")
        }
    }
}
