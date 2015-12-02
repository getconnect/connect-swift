//
//  Select.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public enum Aggregation {
    case count
    case sum(String)
    case avg(String)
    case min(String)
    case max(String)
}

public typealias Select = [String: Aggregation]

extension CollectionType where Generator.Element == (String, Aggregation) {
    var jsonObject: [String: Any] {
        var map = [String: Any]()
        for (alias, aggregation) in self {
            switch aggregation {
            case .count:
                map[alias] = "count"
            case let .sum(field):
                map[alias] = ["sum": field]
            case let .avg(field):
                map[alias] = ["avg": field]
            case let .min(field):
                map[alias] = ["min": field]
            case let .max(field):
                map[alias] = ["max": field]
            }
        }
        return map
    }
}
