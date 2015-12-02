//
//  QueryResults.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//

import Foundation

struct Metadata {
    let groups: GroupBy
    let interval: String?
    let timezone: String?
}

struct QueryResults {
    let metadata: Metadata
    let results: [String: Any]
}

struct IntervalQueryResults {
    let metadata: Metadata
    let results: [String: Any]
}
