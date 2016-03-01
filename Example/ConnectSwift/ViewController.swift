//
//  ViewController.swift
//  ConnectSwift
//
//  Created by chadedrupt on 12/02/2015.
//  Copyright (c) 2015 chadedrupt. All rights reserved.
//

import UIKit
import ConnectSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let connect = Connect(
            projectId: "",
            apiKey: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vYXV0aC5waGFybWFkYXRhLnRlc3QiLCJzdWIiOiJhZGFtQHBoYXJtYWRhdGEubmV0LmF1IiwiYXVkIjoiY3J5c3RhbHl6ZSIsImlhdCI6MTQ1NjgwMTQxMSwiZXhwIjoxNDU2ODA1MDExLCJuYW1lIjoiQWRhbSBHaWxtb3JlIiwicm9sZXMiOlsiRGlzcGVuc2VSZXBvcnRzLkdlbmVyaWNTdWJzdGl0dXRpb25Db250YWluZXIiLCJQb3NSZXBvcnRzLktwaURhc2hib2FyZCIsIlBvc1JlcG9ydHMuUHJvZHVjdEdyb3VwU2hhcmUiLCJEaXNwZW5zZVJlcG9ydHMuRHJ1Z1VzYWdlIiwiQWN0aXZpdHlUb29scy5BY3Rpdml0eVN0YXRlbWVudENvbnRhaW5lciIsIkFjdGl2aXR5VG9vbHMuQnVkZ2V0IiwiQWN0aXZpdHlUb29scy5IZWFsdGgiLCJEaXNwZW5zZVJlcG9ydHMuQWRob2NSZXBvcnRpbmciLCJQb3NSZXBvcnRzLk90Y0dlbmVyaWNzTWFwIiwiUG9zUmVwb3J0cy5PdGNHZW5lcmljc0NvbnRhaW5lciIsIkRpc3BlbnNlUmVwb3J0cy5HZW5lcmljRHJ1Z0xpbmVzIiwiVXNhZ2VSZXBvcnRzLlVzYWdlIiwiRGlzcGVuc2VSZXBvcnRzLlN1YnN0aXR1dGlvblBsYW4iLCJQb3NSZXBvcnRzLlByaWNlRHJvcCIsIkRpc3BlbnNlUmVwb3J0cy5QaGFybWFjeUxpc3QiLCJJbnRlcm5hbFZpZXciLCJIZWFkT2ZmaWNlSW50ZXJuYWxWaWV3IiwiTm90aWNlQm9hcmRBZG1pbiIsIlJlY29uY2lsZVJlcG9ydCIsIkVycm9yTG9ncyJdfQ.LOlW_tqIvrJX4XQe8Y1LAgAbuagvyEOO8FmZlLOnq1s",
            baseUrl: "http://192.168.222.1:1234")
        
        connect.query("PharmaData")
            .select(["scripts": .Sum("[Scripts]")])
            .timeframe(.LastMonth)
            .filter([ "[Pharmacy].[Pharmacy]": .Eq(256) ])
            .execute {
                (result) in
                switch result {
                case .Success(let results):
                    print(results.results.first)
                    print(results.cacheKey)
                case .Failure(let error):
                    print(error)
                }
        }
        
        connect.query("PharmaData")
            .select(["scripts": .Sum("[Scripts]")])
            .timeframe(.LastMonth)
            .filter([ "[Pharmacy].[Pharmacy]": .Eq(256) ])
            .execute {
                (result) in
                switch result {
                case .Success(let results):
                    print(results.results.first)
                    print(results.cacheKey)
                case .Failure(let error):
                    print(error)
                }
        }
    }
    
}
