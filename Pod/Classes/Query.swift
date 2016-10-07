//
//  Query.swift
//  Pods
//
//  Created by Chad Edrupt on 3/12/2015.
//
//

import Foundation

public struct Query {
    
    public let config: QueryConfig
    
    public let select: Select
    public let groupBy: GroupBy
    public let filter: Filter
    public let timeframe: Timeframe?
    public let interval: TimeInterval?
    public let customOptions: [String: AnyObject]?
    
    public var apiClient: Client {
        return Client(connectConfig: config.connectConfig)
    }
    
    public var collectionName: String {
        return config.collection
    }
    
    public var jsonObject: [String: AnyObject] {
        var result: [String: AnyObject] = [
            "select": self.select.jsonObject,
            "groupBy": self.groupBy,
            "filter": self.filter.jsonObject
        ]
        if let timeframe = timeframe {
            result["timeframe"] = timeframe.jsonObject
        }
        result["interval"] = interval?.rawValue
        if let customOptions = customOptions {
            result = result + customOptions
        }
        return result
    }
    
    init(config: QueryConfig) {
        self.config = config
        
        select = Select()
        groupBy = GroupBy()
        filter = Filter()
        
        timeframe = nil
        interval = nil
        customOptions = nil
    }
    
    public init(config: QueryConfig, select: Select, groupBy: GroupBy, filter: Filter, timeframe: Timeframe?, interval: TimeInterval?, customOptions: [String: AnyObject]?) {
        self.config = config
        
        self.select = select
        self.groupBy = groupBy
        self.filter = filter
        self.timeframe = timeframe
        self.interval = interval
        self.customOptions = customOptions
    }
    
}