//
//  QueryResults.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

public typealias QueryCallback = (QueryResults) -> Void
public typealias IntervalQueryCallback = (IntervalQueryResults) -> Void

public protocol Metadata {
    var groups: [String] { get }
    var interval: String? { get }
    var timezone: String? { get }
}

public typealias QueryResultItem = [String: Any]

public protocol QueryResults {
    var metadata: Metadata { get }
    var results: [QueryResultItem] { get }
}

public protocol ResultItemInterval {
    var start: NSDate { get }
    var end: NSDate { get }
}

public protocol IntervalQueryResultItem {
    var interval: ResultItemInterval { get }
    var results: [QueryResultItem] { get }
}

public protocol IntervalQueryResults {
    var metadata: Metadata { get }
    var results: [IntervalQueryResultItem] { get }
}
