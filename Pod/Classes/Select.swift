//
//  Select.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public enum Aggregation {
    case Count
    case Sum(String)
    case Avg(String)
    case Min(String)
    case Max(String)
}

public typealias Select = [String: Aggregation]

extension CollectionType where Generator.Element == (String, Aggregation) {
    var jsonObject: [String: AnyObject] {
        var map = [String: AnyObject]()
        for (alias, aggregation) in self {
            switch aggregation {
            case .Count:
                map[alias] = "count"
            case let .Sum(field):
                map[alias] = ["sum": field]
            case let .Avg(field):
                map[alias] = ["avg": field]
            case let .Min(field):
                map[alias] = ["min": field]
            case let .Max(field):
                map[alias] = ["max": field]
            }
        }
        return map
    }
}
