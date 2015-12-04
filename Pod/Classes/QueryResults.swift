//
//  QueryResults.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation
import SwiftyJSON

public typealias QueryCallback = (QueryResults) -> Void
public typealias IntervalQueryCallback = (IntervalQueryResults) -> Void

public struct Metadata {
    let groups: [String]
    let interval: String?
    let timezone: String?
    
    init(json: JSON) {
        groups = json["groups"].arrayValue.map { $0.string! }
        interval = json["interval"].string
        timezone = json["timezone"].string
    }
}

public typealias QueryResultItem = [String: AnyObject]

public struct QueryResults {
    public let metadata: Metadata
    public let results: [QueryResultItem]
    
    init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        results = json["results"].arrayValue.map { $0.dictionaryObject! }
    }
}

public struct ResultItemInterval {
    public let start: NSDate
    public let end: NSDate
    
    init(json: JSON) {
        let startDate = json["start"].stringValue
        let endDate = json["end"].stringValue
        start = NSDateFormatter.iso8601Formatter.dateFromString(startDate)!
        end = NSDateFormatter.iso8601Formatter.dateFromString(endDate)!
    }
}

public struct IntervalQueryResultItem {
    public let interval: ResultItemInterval
    public let results: [QueryResultItem]
    
    init(json: JSON) {
        interval = ResultItemInterval(json: json["interval"])
        results = json["results"].arrayValue.map { $0.dictionaryObject! }
    }
}

public struct IntervalQueryResults {
    public let metadata: Metadata
    public let results: [IntervalQueryResultItem]
    
    init(json: JSON) {
        metadata = Metadata(json: json["metadata"])
        results = json["results"].arrayValue.map { IntervalQueryResultItem(json: $0) }
    }
}
