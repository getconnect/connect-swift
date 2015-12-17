//
//  iso8601.swift
//  ConnectSwift
//
//  Created by Chad Edrupt on 2/12/2015.
//  Copyright © 2015 Connect. All rights reserved.
//
import Foundation

extension NSDateFormatter {
    
    static var iso8601Formatter: NSDateFormatter {
        let dateFormatter = NSDateFormatter()
        let enUSPosixLocale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.locale = enUSPosixLocale
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }
    
}

extension NSDate {
    
    var iso8601String: String {
        return NSDateFormatter.iso8601Formatter.stringFromDate(self)
    }
    
}