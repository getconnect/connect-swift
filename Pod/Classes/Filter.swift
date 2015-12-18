//
//  Filter.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public enum Comparison {
    case Eq(AnyObject)
    case Neq(AnyObject)
    case Gt(AnyObject)
    case Gte(AnyObject)
    case Lt(AnyObject)
    case Lte(AnyObject)
    case Exists
    case DoesNotExist
    case StartsWith(String)
    case EndsWith(String)
    case Contains(String)
    case Inside([AnyObject])
}
public typealias Filter = [String: Comparison]

extension CollectionType where Generator.Element == (String, Comparison) {
    var jsonObject: [String: AnyObject] {
        var map = [String: AnyObject]()
        for (field, comparison) in self {
            switch comparison {
            case let .Eq(value):
                map[field] = ["eq": value]
            case let .Neq(value):
                map[field] = ["neq": value]
            case let .Gt(value):
                map[field] = ["gt": value]
            case let .Gte(value):
                map[field] = ["gte": value]
            case let .Lt(value):
                map[field] = ["lt": value]
            case let .Lte(value):
                map[field] = ["lte": value]
            case .Exists:
                map[field] = ["exists": true]
            case .DoesNotExist:
                map[field] = ["exists": false]
            case let .StartsWith(value):
                map[field] = ["startsWith": value]
            case let .EndsWith(value):
                map[field] = ["endsWith": value]
            case let .Contains(value):
                map[field] = ["contains": value]
            case let .Inside(value):
                map[field] = ["in": value]
            }
        }
        return map
    }
}
