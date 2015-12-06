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
    
        let connect = Connect(
            projectId: "559de2011f2ddd1860bd29fb",
            apiKey: "F72EE2F564DBE33DF66171A775CD7B4E-7EE5844C84B9E3F88F87FBD0421B79063CB13858C93C4E0ED1F346522057283D8CC22C8FEDE3E8E088CD91B9BDAA25BE2AF8A3A5320C87282EB96FA98E8E8369")
        
        connect.query("orders")
            .select(["test": .count])
            .timeframe(.thisYear)
            .groupBy("pizza.type.value")
            .interval(.weekly)
            .timeframe(.thisYear)
            .execute {
                (result) in
                switch result {
                case .Success(let results):
                    print(results.results.first?.results)
                case .Failure(let error):
                    print(error)
                }
            }
        
        
    }
    
}
