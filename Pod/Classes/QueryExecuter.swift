//
//  QueryExecuter.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 3/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation
import Alamofire

public protocol QueryExecuter {
    func execute(completion: Result<QueryResults, NSError> -> Void) -> Request
}
extension QueryExecuter where Self:QueryBuilder {
    
    public func execute(completion: Result<QueryResults, NSError> -> Void) -> Request {
        return apiClient.query(collectionName, parameters: jsonObject) {
            (result) in
            switch result {
            case .Success(let json):
                let queryResult = QueryResults(json: json)
                completion(Result.Success(queryResult))
            case .Failure(let error):
                completion(Result.Failure(error))
            }
        }
    }
}

public protocol IntervalQueryExecuter {
    func execute(completion: Result<IntervalQueryResults, NSError> -> Void) -> Request
}
extension IntervalQueryExecuter where Self:IntervalQueryBuilder {
    
    public func execute(completion: Result<IntervalQueryResults, NSError> -> Void) -> Request {
        return apiClient.query(collectionName, parameters: jsonObject) {
            (result) in
            switch result {
            case .Success(let json):
                let intervalQueryResult = IntervalQueryResults(json: json)
                completion(Result.Success(intervalQueryResult))
            case .Failure(let error):
                completion(Result.Failure(error))
            }
        }
    }
}
