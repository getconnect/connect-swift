//
//  QueryBuilder.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public typealias GroupBy = [String]

struct QueryConfig {
    let config: ConnectConfig
    let collection: String
}

public struct QueryBuilder {
    let config: QueryConfig;
    
    let select: Select
    let groupBy: GroupBy
    let filter: Filter
    let timeframe: Timeframe?
    let customTimeframe: CustomTimeframe?
    let interval: TimeInterval?
    
    init(config: QueryConfig) {
        self.config = config
        
        select = Select()
        groupBy = GroupBy()
        filter = Filter()
        
        timeframe = nil
        customTimeframe = nil
        interval = nil
    }
    
    init(config: QueryConfig, select: Select, groupBy: GroupBy, filter: Filter, timeframe: Timeframe?, customTimeframe: CustomTimeframe?, interval: TimeInterval?) {
        self.config = config
        
        self.select = select
        self.groupBy = groupBy
        self.filter = filter
        self.timeframe = timeframe
        self.customTimeframe = customTimeframe
        self.interval = interval
    }
    
    public func select(select: Select) -> QueryBuilder {
        return QueryBuilder(config: config, select: self.select + select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    public func groupBy(groupBy: GroupBy) -> QueryBuilder {
        return QueryBuilder(config: config, select: select, groupBy: self.groupBy + groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    public func filter(filter: Filter) -> QueryBuilder {
        return QueryBuilder(config: config, select: select, groupBy: groupBy, filter: self.filter + filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    public func timeframe(timeframe: Timeframe) -> QueryBuilder {
        return QueryBuilder(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: nil, interval: interval)
    }
    func timeframe(from: NSDate, to: NSDate) -> QueryBuilder {
        return QueryBuilder(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: nil, customTimeframe: CustomTimeframe(from: from, to: to), interval: interval)
    }
    public func interval(interval: TimeInterval) -> QueryBuilder {
        return QueryBuilder(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    
    public func execute(completion: (results: Any) -> Void) -> QueryBuilder {
        let selectsDictionary = self.select.jsonRepresentation
        let filterDictionary = self.filter.jsonRepresentation
        
        print(filterDictionary)
        print(selectsDictionary)
        
        completion(results: select)
        return self
    }
    
}
