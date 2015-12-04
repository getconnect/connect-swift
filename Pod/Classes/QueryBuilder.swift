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
    internal let connectConfig: ConnectConfig
    internal let collection: String
}

public protocol Queryable {
    var apiClient: Client { get }
    var collectionName: String { get }
    var jsonObject: [String: AnyObject] { get }
}

public protocol QueryBuilder: Queryable, QueryExecuter {
    
    func select(select: [String: Aggregation]) -> QueryBuilder
    
    func groupBy(groupBy: String) -> QueryBuilder
    func groupBy(groupBy: [String]) -> QueryBuilder
    
    func filter(filter: Filter) -> QueryBuilder
    
    func timeframe(timeframe: Timeframe) -> QueryBuilder
    func timeframe(start: NSDate, end: NSDate) -> QueryBuilder
    
    func interval(interval: TimeInterval) -> IntervalQueryBuilder
}

public protocol IntervalQueryBuilder: Queryable, IntervalQueryExecuter {
    
    func select(select: [String: Aggregation]) -> IntervalQueryBuilder
    
    func groupBy(groupBy: String) -> IntervalQueryBuilder
    func groupBy(groupBy: [String]) -> IntervalQueryBuilder
    
    func filter(filter: Filter) -> IntervalQueryBuilder
    
    func timeframe(timeframe: Timeframe) -> IntervalQueryBuilder
    func timeframe(start: NSDate, end: NSDate) -> IntervalQueryBuilder
    
    func interval(interval: TimeInterval) -> IntervalQueryBuilder
}

extension Query: QueryBuilder {
    
    public func select(select: [String: Aggregation]) -> QueryBuilder {
        return Query(config: config, select: self.select + select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    
    public func groupBy(groupBy: String) -> QueryBuilder {
        return Query(config: config, select: select, groupBy: self.groupBy + [groupBy], filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    public func groupBy(groupBy: [String]) -> QueryBuilder {
        return Query(config: config, select: select, groupBy: self.groupBy + groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    
    public func filter(filter: Filter) -> QueryBuilder {
        return Query(config: config, select: select, groupBy: groupBy, filter: self.filter + filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    
    public func timeframe(timeframe: Timeframe) -> QueryBuilder {
        return Query(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: nil, interval: interval)
    }
    public func timeframe(start: NSDate, end: NSDate) -> QueryBuilder {
        return Query(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: nil, customTimeframe: CustomTimeframe(start: start, end: end), interval: interval)
    }
    
    public func interval(interval: TimeInterval) -> IntervalQueryBuilder {
        return Query(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
}

extension Query: IntervalQueryBuilder {
    
    public func select(select: [String: Aggregation]) -> IntervalQueryBuilder {
        return Query(config: config, select: self.select + select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    
    public func groupBy(groupBy: String) -> IntervalQueryBuilder {
        return Query(config: config, select: select, groupBy: self.groupBy + [groupBy], filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    public func groupBy(groupBy: [String]) -> IntervalQueryBuilder {
        return Query(config: config, select: select, groupBy: self.groupBy + groupBy, filter: filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    
    public func filter(filter: Filter) -> IntervalQueryBuilder {
        return Query(config: config, select: select, groupBy: groupBy, filter: self.filter + filter, timeframe: timeframe, customTimeframe: customTimeframe, interval: interval)
    }
    
    public func timeframe(timeframe: Timeframe) -> IntervalQueryBuilder {
        return Query(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: timeframe, customTimeframe: nil, interval: interval)
    }
    public func timeframe(start: NSDate, end: NSDate) -> IntervalQueryBuilder {
        return Query(config: config, select: select, groupBy: groupBy, filter: filter, timeframe: nil, customTimeframe: CustomTimeframe(start: start, end: end), interval: interval)
    }
}

