//
//  QueryExecuter.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 3/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public protocol QueryExecuter {
    func execute(completion: Result<QueryResults, NSError> -> Void)
}

public protocol IntervalQueryExecuter {
    func execute(completion: Result<IntervalQueryResults, NSError> -> Void)
}

extension QueryExecuter where Self:QueryBuilder {
    public func execute(completion: Result<QueryResults, NSError> -> Void) {
        apiClient.query(collectionName, parameters: jsonObject)
        
    }
}

extension IntervalQueryExecuter where Self:IntervalQueryBuilder {
    public func execute(completion: Result<IntervalQueryResults, NSError> -> Void) {
        apiClient.query(collectionName, parameters: jsonObject)
        
    }
}
