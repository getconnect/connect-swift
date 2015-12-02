//
//  Timeframe.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public enum Timeframe: String {
    case thisMinute = "this_minute"
    case lastMinute = "last_minute"
    case thisHour = "this_hour"
    case lastHour = "last_hour"
    case today = "today"
    case yesterday = "yesterday"
    case thisWeek = "this_week"
    case lastWeek = "last_week"
    case thisMonth = "this_month"
    case lastMonth = "last_month"
    case thisQuarter = "this_quarter"
    case lastQuarter = "last_quarter"
    case thisYear = "this_year"
    case lastYear = "last_year"
}

struct CustomTimeframe {
    let from: NSDate
    let to: NSDate
}

