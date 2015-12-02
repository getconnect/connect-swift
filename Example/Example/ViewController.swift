//
//  ViewController.swift
//  Example
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import UIKit
import ConnectSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let connect = Connect(projectId: "saqerqerqr", apiKey: "saqerqerqr")
        
        let query = connect.query("Purchases")
            .select([
                "count": .count,
                "totalSales": .sum("price"),
                "averagePrice": .avg("price"),
                "minPrice": .min("price"),
                "maxPrice": .max("price")
                ])
            .groupBy(["brand"])
            .filter([
                "price": .gt(100)
                ])
            .timeframe(.lastHour)
            .interval(.minutely)
        
        let another = query.filter(["price": .lte(200)])
        
        query.execute { (results) in
            //print(results)
        }
        
        another.execute { (results) in
            //print(results)
        }
    }


}

