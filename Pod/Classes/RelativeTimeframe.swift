//
//  RelativeTimeframe.swift
//  Pods
//
//  Created by Chad Edrupt on 4/01/2016.
//
//

import Foundation

public enum RelativeTimeframe {
    
    case Minutes(Int)
    case Hours(Int)
    case Days(Int)
    case Weeks(Int)
    case Months(Int)
    case Quarters(Int)
    case Years(Int)
    
    var jsonObject: AnyObject {
        switch self {
        case let .Minutes(value):
            return ["minutes": value]
        case let .Hours(value):
            return ["hours": value]
        case let .Days(value):
            return ["days": value]
        case let .Weeks(value):
            return ["weeks": value]
        case let .Months(value):
            return ["months": value]
        case let .Quarters(value):
            return ["quarters": value]
        case let .Years(value):
            return ["years": value]
        }
    }
    
}

extension RelativeTimeframe: Equatable { }
public func ==(lhs: RelativeTimeframe, rhs: RelativeTimeframe) -> Bool {
    switch (lhs, rhs) {
    case (let .Minutes(lhsValue), let .Minutes(rhsValue)):
        return lhsValue == rhsValue
    case (let .Hours(lhsValue), let .Hours(rhsValue)):
        return lhsValue == rhsValue
    case (let .Days(lhsValue), let .Days(rhsValue)):
        return lhsValue == rhsValue
    case (let .Weeks(lhsValue), let .Weeks(rhsValue)):
        return lhsValue == rhsValue
    case (let .Months(lhsValue), let .Months(rhsValue)):
        return lhsValue == rhsValue
    case (let .Quarters(lhsValue), let .Quarters(rhsValue)):
        return lhsValue == rhsValue
    case (let .Years(lhsValue), let .Years(rhsValue)):
        return lhsValue == rhsValue
    default:
        return false
    }
}
