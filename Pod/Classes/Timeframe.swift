//
//  Timeframe.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public enum Timeframe {
    
    case ThisMinute
    case LastMinute
    case ThisHour
    case LastHour
    case Today
    case Yesterday
    case ThisWeek
    case LastWeek
    case ThisMonth
    case LastMonth
    case ThisQuarter
    case LastQuarter
    case ThisYear
    case LastYear
    case Custom(NSDate?, NSDate?)
    case Current(RelativeTimeframe)
    case Previous(RelativeTimeframe)
    
    public var jsonObject: AnyObject {
        switch self {
        case .ThisMinute:
            return "this_minute"
        case .LastMinute:
            return "last_minute"
        case .ThisHour:
            return "this_hour"
        case .LastHour:
            return "last_hour"
        case .Today:
            return "today"
        case .Yesterday:
            return "yesterday"
        case .ThisWeek:
            return "this_week"
        case .LastWeek:
            return "last_week"
        case .ThisMonth:
            return "this_month"
        case .LastMonth:
            return "last_month"
        case .ThisQuarter:
            return "this_quarter"
        case .LastQuarter:
            return "last_quarter"
        case .ThisYear:
            return "this_year"
        case .LastYear:
            return "last_year"
        case .Custom(let start, let end):
            return [
                "start": start?.iso8601String ?? "",
                "end": end?.iso8601String ?? ""
            ]
        case .Current(let relative):
            return ["current": relative.jsonObject]
        case .Previous(let relative):
            return ["previous": relative.jsonObject]
        }
    }
}

extension Timeframe: Equatable { }
public func ==(lhs: Timeframe, rhs: Timeframe) -> Bool {
    switch (lhs, rhs) {
    case (.Today, .Today):
        return true
    case (.Yesterday, .Yesterday):
        return true
    case (.ThisWeek, .ThisWeek):
        return true
    case (.LastWeek, .LastWeek):
        return true
    case (.ThisMonth, .ThisMonth):
        return true
    case (.LastMonth, .LastMonth):
        return true
    case (.ThisYear, .ThisYear):
        return true
    case (.LastYear, .LastYear):
        return true
    case (let .Custom(firstStart, firstEnd), let .Custom(secondStart, secondEnd)):
        return firstStart == secondStart && firstEnd == secondEnd
    case (let .Current(lhsValue), let .Current(rhsValue)):
        return lhsValue == rhsValue
    case (let .Previous(lhsValue), let .Previous(rhsValue)):
        return lhsValue == rhsValue
    default:
        return false
    }
}

