//
//  Filter.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public enum Comparison {
    case eq(Equatable)
    case neq(Equatable)
    case gt(Comparable)
    case gte(Comparable)
    case lt(Comparable)
    case lte(Comparable)
    case exists(Equatable)
    case startsWith(String)
    case endsWith(String)
    case contains(String)
}
public typealias Filter = [String: Comparison]

extension CollectionType where Generator.Element == (String, Comparison) {
    var jsonRepresentation: [String: Any] {
        var map = [String: Any]()
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
            case let .exists(value):
                map[field] = ["exists": value]
            case let .startsWith(value):
                map[field] = ["startsWith": value]
            case let .endsWith(value):
                map[field] = ["endsWith": value]
            case let .contains(value):
                map[field] = ["contains": value]
            }
        }
        return map
    }
}
