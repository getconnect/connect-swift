//
//  ViewController.swift
//  ConnectSwift
//
//  Created by chadedrupt on 12/02/2015.
//  Copyright (c) 2015 chadedrupt. All rights reserved.
//

import UIKit
import ConnectSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let connect = Connect(projectId: "558792f9fb269a102466dadc",
            apiKey: "958603FFBCF9C63513BCEEFD0C6F90A3-F3FEA20ACD2D4C9F09B59571D1353897143058A0F91EF0D3569E6C52D46DA27A32E620784D566AE6A00CDBFE55361A659B9182A6A9E4B094835EEDF3BB24BCCA",
            baseUrl: "http://api.connect.test")
        
        
        let query = connect.query("Purchases")
            .select(["test": .count])
            .timeframe(.thisYear)
        
        query.execute { (results) in
            //print(results)
        }
        
    }
    
}
