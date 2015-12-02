//
//  Connect.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

struct ConnectConfig {
    let projectId: String
    let apiKey: String
    let apiURL: String
}

public class Connect {
    
    var config: ConnectConfig
    
    public init(projectId: String, apiKey: String, apiURL: String = "https://api.getconnect.io") {
        config = ConnectConfig(projectId: projectId, apiKey: apiKey, apiURL: apiURL)
    }
    
    public func query(collectionName: String) -> QueryBuilder {
        let queryConfig = QueryConfig(config: config, collection: collectionName)
        return QueryBuilder(config: queryConfig)
    }
    
}

