//
//  Timeframe.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public struct CustomTimeframe {
    let start: NSDate
    let end: NSDate
}

extension CustomTimeframe: Equatable { }
public func ==(lhs: CustomTimeframe, rhs: CustomTimeframe) -> Bool {
    return lhs.start == rhs.start && lhs.end == rhs.end
}

public enum Timeframe {
    
    case thisMinute
    case lastMinute
    case thisHour
    case lastHour
    case today
    case yesterday
    case thisWeek
    case lastWeek
    case thisMonth
    case lastMonth
    case thisQuarter
    case lastQuarter
    case thisYear
    case lastYear
    case custom(CustomTimeframe)
    
    var jsonObject: AnyObject {
        switch self {
        case .thisMinute:
            return "this_minute"
        case .lastMinute:
            return "last_minute"
        case .thisHour:
            return "this_hour"
        case .lastHour:
            return "last_hour"
        case .today:
            return "today"
        case .yesterday:
            return "yesterday"
        case .thisWeek:
            return "this_week"
        case .lastWeek:
            return "last_week"
        case .thisMonth:
            return "this_month"
        case .lastMonth:
            return "last_month"
        case .thisQuarter:
            return "this_quarter"
        case .lastQuarter:
            return "last_quarter"
        case .thisYear:
            return "this_year"
        case .lastYear:
            return "last_year"
        case .custom(let customTimeframe):
            return [
                "start": customTimeframe.start.iso8601String,
                "end": customTimeframe.end.iso8601String
            ]
        }
    }
}

extension Timeframe: Equatable { }
public func ==(lhs: Timeframe, rhs: Timeframe) -> Bool {
    switch (lhs, rhs) {
    case (.today, .today):
        return true
    case (.yesterday, .yesterday):
        return true
    case (.thisWeek, .thisWeek):
        return true
    case (.lastWeek, .lastWeek):
        return true
    case (.thisMonth, .thisMonth):
        return true
    case (.lastMonth, .lastMonth):
        return true
    case (.thisYear, .thisYear):
        return true
    case (.lastYear, .lastYear):
        return true
    case (let .custom(firstCustomDate), let .custom(secondCustomDate)):
        return firstCustomDate == secondCustomDate
    default:
        return false
    }
}

