//
//  QueryExecutor.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation
import Alamofire

struct QueryExecuter {
    
    let queryConfig: QueryConfig
    
    var headers: [String: String] {
        get {
            return [
                "X-Project-Id": queryConfig.config.projectId,
                "X-Api-Key": queryConfig.config.projectId
            ]
        }
    }
    
    init(queryConfig: QueryConfig) {
        self.queryConfig = queryConfig
    }
    
    func execute() {
        
    }
    
}

