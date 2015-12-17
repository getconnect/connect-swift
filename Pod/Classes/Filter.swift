//
//  Filter.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public enum Comparison {
    case eq(AnyObject)
    case neq(AnyObject)
    case gt(AnyObject)
    case gte(AnyObject)
    case lt(AnyObject)
    case lte(AnyObject)
    case exists
    case doesNotExist
    case startsWith(String)
    case endsWith(String)
    case contains(String)
    case inside([AnyObject])
}
public typealias Filter = [String: Comparison]

extension CollectionType where Generator.Element == (String, Comparison) {
    var jsonObject: [String: AnyObject] {
        var map = [String: AnyObject]()
        for (field, comparison) in self {
            switch comparison {
            case let .eq(value):
                map[field] = ["eq": value]
            case let .neq(value):
                map[field] = ["neq": value]
            case let .gt(value):
                map[field] = ["gt": value]
            case let .gte(value):
                map[field] = ["gte": value]
            case let .lt(value):
                map[field] = ["lt": value]
            case let .lte(value):
                map[field] = ["lte": value]
            case .exists:
                map[field] = ["exists": true]
            case .doesNotExist:
                map[field] = ["exists": false]
            case let .startsWith(value):
                map[field] = ["startsWith": value]
            case let .endsWith(value):
                map[field] = ["endsWith": value]
            case let .contains(value):
                map[field] = ["contains": value]
            case let .inside(value):
                map[field] = ["in": value]
            }
        }
        return map
    }
}
